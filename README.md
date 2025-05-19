# 서울대학교 대학원 학위논문 LaTex 양식

https://www.overleaf.com/latex/templates/snu-dissertation-template/fxvtwvxzdpvp
에 바탕을 두고 물리천문학부 (물리학전공) 의 필요에 맞추어 수정함.

수정사항이 있다면 Pull Request 를 부탁드립니다.

## 사용법

0. 대학원에 입학하고 연구를 열심히 하여 학위논문 제목 및 내용을 완성한다.
1. `thesis_and_committee.tex` 에 필요한 내용을 작성한다.
2. `injun.tex` 에 본인 이름을 수정한다.
3. `pdflatex injun.tex` 로 컴파일하여 인준지 `injun.pdf` 를 생성한다. (공개심사 날 인쇄하여 가져가서 서명 받아야 함.)
4. `thesis.tex` 에 본인 이름, 키워드, 영문 및 국문 초록을 작성한다.
5. `chapter1.tex` 에 1장 서론을 작성한다. `chapter2.tex` 에 2장 본문을 작성한다. 나머지 장도 완성한다.
6. `pdflatex thesis; bibtex thesis; pdflatex thesis; pdflatex thesis` 로 컴파일하여 `thesis.pdf` 를 완성한다.


## 기타
* 장 별로 따로 컴파일을 하고자 할 경우, `test_chapter.tex` 의 `\input{chapter1.tex}` 부분을 원하는 파일로 수정하여 컴파일하면 된다. Overleaf 에서는 메뉴-Main document 를 `test_chapter.tex` 로 설정하면 편하다.
* 사용하는 alias 가 있다면 `mypackages.sty` 에 추가하면 된다.
* 참고문헌은 `references.bib` 에 추가한다.
