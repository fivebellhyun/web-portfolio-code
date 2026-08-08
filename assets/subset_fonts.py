#!/usr/bin/env python3
"""
assets/fonts/notosans.ttf 서브셋 생성기.

원본 Noto Sans KR Regular 은 24,845 글리프(현대 한글 11,172 + 한중일 한자 8,138 +
가나 189 …)를 담고 있어 6MB 입니다. 이 폰트는 theme 의 fontFamily 로 지정돼 있어
첫 프레임 전에 전부 다운로드됩니다. 즉 초기 로딩 시간을 지배합니다.

이 스크립트는 KS X 1001 상용 한글 2,350자 + 기본 라틴/기호 + 자모
+ lib/ 소스에 실제 등장하는 모든 문자를 남기고 나머지를 버립니다.

사용:
    pip install fonttools brotli zopfli
    python3 tool/subset_font.py                 # 서브셋 만들고 교체
    python3 tool/subset_font.py --full-hangul   # 현대 한글 11,172자 전체 유지
    python3 tool/subset_font.py --dry-run       # 크기만 비교

원본이 필요하면 Google Fonts 에서 다시 받을 수 있습니다:
    https://fonts.google.com/noto/specimen/Noto+Sans+KR
"""
import argparse
import glob
import gzip
import os
import re
import shutil
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FONT = os.path.join(ROOT, "assets", "fonts", "notosans.ttf")


def chars_in_source() -> set:
    """lib/ 의 모든 문자열 리터럴에 등장하는 문자."""
    found = set()
    for path in glob.glob(os.path.join(ROOT, "lib", "**", "*.dart"), recursive=True):
        src = open(path, encoding="utf-8").read()
        for a, b in re.findall(r'"((?:[^"\\]|\\.)*)"|\'((?:[^\'\\]|\\.)*)\'', src):
            found |= set(a or b)
    return {c for c in found if ord(c) > 31}


def is_ksx1001(ch: str) -> bool:
    """KS X 1001 완성형에 포함된 한글 음절인지 (상용 2,350자)."""
    try:
        b = ch.encode("euc-kr")
    except UnicodeEncodeError:
        return False
    return len(b) == 2 and 0xB0 <= b[0] <= 0xC8 and 0xA1 <= b[1] <= 0xFE


def hangul_set(full: bool) -> set:
    out = set()
    for cp in range(0xAC00, 0xD7A4):
        ch = chr(cp)
        if full:
            try:
                ch.encode("euc-kr")
                out.add(ch)
            except UnicodeEncodeError:
                pass
        elif is_ksx1001(ch):
            out.add(ch)
    return out


def build_charset(full: bool) -> set:
    latin = {chr(c) for c in range(0x20, 0x7F)}
    jamo = {chr(c) for c in range(0x3131, 0x3164)}
    symbols = set("…—–‘’“”·₩※→←↑↓°±×÷　")
    return hangul_set(full) | latin | jamo | symbols | chars_in_source()


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--full-hangul", action="store_true",
                    help="현대 한글 11,172자 전체 유지 (사용자 입력 텍스트를 표시할 때)")
    ap.add_argument("--dry-run", action="store_true", help="교체하지 않고 크기만 비교")
    args = ap.parse_args()

    if not os.path.exists(FONT):
        print(f"폰트를 찾을 수 없습니다: {FONT}", file=sys.stderr)
        return 1

    charset = build_charset(args.full_hangul)
    txt = os.path.join(ROOT, ".subset_chars.txt")
    out = FONT + ".subset"
    open(txt, "w", encoding="utf-8").write("".join(sorted(charset)))

    subprocess.run([
        "pyftsubset", FONT,
        "--text-file=" + txt,
        "--output-file=" + out,
        # 한글 조합/커닝에 필요한 것만 남깁니다.
        "--layout-features=kern,liga,ccmp,mark,mkmk",
        # 세로쓰기 테이블은 웹에서 쓰지 않습니다.
        "--drop-tables+=vmtx,vhea,VORG",
        "--no-hinting",
        "--desubroutinize",
    ], check=True)
    os.remove(txt)

    gz = lambda p: len(gzip.compress(open(p, "rb").read(), 9))
    before, after = os.path.getsize(FONT), os.path.getsize(out)
    print()
    print(f"  문자 수     {len(charset):,}")
    print(f"  파일        {before/1024:,.0f} KB  →  {after/1024:,.0f} KB")
    print(f"  gzip 전송   {gz(FONT)/1024:,.0f} KB  →  {gz(out)/1024:,.0f} KB "
          f"({(1 - gz(out)/gz(FONT)) * 100:.0f}% 감소)")

    if args.dry_run:
        os.remove(out)
        print("\n  --dry-run 이므로 교체하지 않았습니다.")
    else:
        shutil.move(out, FONT)
        print(f"\n  교체 완료: {FONT}")
        print("  flutter clean && flutter build web --release --wasm")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())