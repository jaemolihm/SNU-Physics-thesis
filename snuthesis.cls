%% This is file `snuthesis.cls`.
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This is an unofficial SNU LaTeX class.
%%
%% Modified by: Sungju Moon @ CUMG (last updated 20210318)
%% Original Author: zeta709 (zeta709@gmail.com)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options
%%
%% ko: Korean Thesis
%%
%% indentfirst: Using indentfirst package. (Korean default)
%% noindentfirst: Not using indentfirst package. (English default)
%%
%% easy: some automatic set-up options
%%
%% draft, final, leqno, fleqn, openright, openay,
%% openbib, oneside, twoside: report class
%%
%% nonfrench, finemath, strictcharcheck: kotex package
%%
%% under: undergrad
%% ms, master: master's
%% phd, doctor: PhD
%%
%% 4x6: 사륙배판. Some argue that the paper size must be (188 mm x 258 mm)
%% SNU library manual specifies (190 mm x 260 mm)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 사용 환경
%% 
%% TeXLive recommended; Works fine with MikTeX
%%
%% Dependencies
%%
%% * report class
%% * kotex package
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 기타
%% 
%% @snu@ko와 같이 @을 넣는 것은 명령어를 내부 명령어로 사용하는 것이다.
%% 그리고 @snu를 넣은 것은 다른 패키지와 충돌할 가능성을 방지하기 위해서이다.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{snuthesis}
[2021/05/07 v1.2 CUMG dissertation template class]

\newif\if@snu@under
\newif\if@snu@ms
\newif\if@snu@phd

\newif\if@snu@ko %% true이면 국문 논문.
\@snu@kofalse %% 기본값은 영문 논문.

\newif\if@snu@indentfirst %% true이면 section의 첫 단락도 들여쓴다.
\@snu@indentfirstfalse
\newif\if@snu@indentoptionset
\@snu@indentoptionsetfalse

\newif\if@snu@easy %% easy option
\@snu@easyfalse %% 기본값은 false.

\newif\if@snu@fsbp
\@snu@fsbpfalse

\DeclareOption{4x6}{\@snu@fsbptrue}

\DeclareOption{under}{\@snu@undertrue \@snu@msfalse \@snu@phdfalse}
\DeclareOption{ms}{\@snu@underfalse \@snu@mstrue \@snu@phdfalse}
\DeclareOption{master}{\@snu@underfalse \@snu@mstrue \@snu@phdfalse}
\DeclareOption{phd}{\@snu@underfalse \@snu@msfalse \@snu@phdtrue}
\DeclareOption{doctor}{\@snu@underfalse \@snu@msfalse \@snu@phdtrue}

\DeclareOption{ko}{\@snu@kotrue}
\DeclareOption{indentfirst}{\@snu@indentfirsttrue \@snu@indentoptionsettrue}
\DeclareOption{noindentfirst}{\@snu@indentfirstfalse \@snu@indentoptionsettrue}
\DeclareOption{easy}{\@snu@easytrue}

\DeclareOption{draft}{\PassOptionsToClass{draft}{report}}
\DeclareOption{final}{\PassOptionsToClass{final}{report}}
\DeclareOption{leqno}{\PassOptionsToClass{leqno}{report}}
\DeclareOption{fleqn}{\PassOptionsToClass{fleqn}{report}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{report}}
\DeclareOption{openany}{\PassOptionsToClass{openany}{report}}
\DeclareOption{openbib}{\PassOptionsToClass{openbib}{report}}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{report}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{report}}

\DeclareOption{nonfrench}{\PassOptionsToClass{nonfrench}{kotex}}
\DeclareOption{finemath}{\PassOptionsToClass{finemath}{kotex}}
\DeclareOption{strictcharcheck}{\PassOptionsToClass{strictcharcheck}{kotex}}
%% hangul, nojosa, hanja 옵션은 의도적으로 제공하지 않음.

\ExecuteOptions{phd} % phd default
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\@snu@koen}{%
	\if@snu@ko \expandafter\@firstoftwo
	\else \expandafter\@secondoftwo
	\fi
}
% Usage: \@snu@koen{한글}{English}

\newcommand{\@snu@msphd}{%
	\if@snu@ms \expandafter\@firstoftwo
	\else \expandafter\@secondoftwo
	\fi
}
% Usage: \@snu@msphd{M.S.}{Ph.D.}

%% ProcessOptions 뒤에 나와야 정상적으로 동작한다.
\if@snu@under % 학부
	\if@snu@ko
		\PassOptionsToClass{a4paper,10pt}{report}
	\else
		\PassOptionsToClass{a4paper,11pt}{report}
	\fi
\else % 대학원
	\PassOptionsToClass{b5paper,11pt}{report}
\fi
\LoadClass[onecolumn]{report}

\if@snu@ko
	\RequirePackage{kotex}
	%% The UK TeX FAQ
	%% Your 437 Questions Answered
	%% version 3.19a, date 2009-06-13, p.211.
	\renewcommand{\abstractname}{초~~록} %
	%\renewcommand{\alsoname}{see also} % (makeidx package)
	\renewcommand{\appendixname}{부록} %
	\renewcommand{\bibname}{참고문헌} % (report,book)
	%\renewcommand{\ccname}{cc} % (letter)
	%\renewcommand{\chaptername}{Chapter} % (report,book)
	\newcommand{\snuchappre}{제}
	\newcommand{\snuchappost}{\space장}
	\renewcommand{\contentsname}{목차} %
	%\renewcommand{\enclname}{encl} % (letter)
	\renewcommand{\figurename}{그림} % (for captions)
	%\renewcommand{\headtoname}{To} % (letter)
	\renewcommand{\indexname}{색인} %
	\renewcommand{\listfigurename}{그림 목차} %
	\renewcommand{\listtablename}{표 목차} %
	%\renewcommand{\pagename}{Page} % (letter)
	%\renewcommand{\partname}{Part} %
	%\renewcommand{\refname}{References} % (article)
	%\renewcommand{\seename}{see} % (makeidx package)
	\renewcommand{\tablename}{표} % (for caption)
	\newcommand{\keywordname}{주요어}
	\newcommand{\keywordnamealt}{Keywords}
	\newcommand{\studentnumbername}{학번}
	\newcommand{\studentnumbernamealt}{Student Number}
	\newcommand{\abstractnamealt}{Abstract}
	\newcommand{\acknowledgementname}{감사의 글}
	\g@addto@macro\appendix{%
		\renewcommand{\snuchappre}{부록}%
		\renewcommand{\snuchappost}{}%
	}
	%% 참고사항
	%% kotex에 [hangul] 옵션을 주면
	%% 여기서 변경한 사항이 덮어쓰여진다.
	%% babel 패키지도 비슷한 역할을 할 수 있다.
\else
	\RequirePackage{kotex}
	%% The UK TeX FAQ
	%% Your 437 Questions Answered
	%% version 3.19a, date 2009-06-13, p. 211.
	%\renewcommand{\abstractname}{Abstract} %
	%\renewcommand{\alsoname}{see also} % (makeidx package)
	%\renewcommand{\appendixname}{Appendix} %
	%\renewcommand{\bibname}{Bibliography} % (report,book)
	%\renewcommand{\ccname}{cc} % (letter)
	%\renewcommand{\chaptername}{Chapter} % (report,book)
	%\renewcommand{\contentsname}{Contents} %
	%\renewcommand{\enclname}{encl} % (letter)
	%\renewcommand{\figurename}{Figure} % (for captions)
	%\renewcommand{\headtoname}{To} % (letter)
	%\renewcommand{\indexname}{Index} %
	%\renewcommand{\listfigurename}{List of Figures} %
	%\renewcommand{\listtablename}{List of Tables} %
	%\renewcommand{\pagename}{Page} % (letter)
	%\renewcommand{\partname}{Part} %
	%\renewcommand{\refname}{References} % (article)
	%\renewcommand{\seename}{see} % (makeidx package)
	%\renewcommand{\tablename}{Table} % (for caption)
	\newcommand{\keywordname}{Keywords}
	\newcommand{\keywordnamealt}{주요어}
	\newcommand{\studentnumbername}{Student ID}
	\newcommand{\studentnumbernamealt}{학\hphantom{요}번}
	\newcommand{\abstractnamealt}{초~~록} % change to 국~문~초~록 if so desired
	\newcommand{\acknowledgementname}{감사의 글} 
	\newcommand{\acknowledgmentname}{Acknowledgments} % English acknowledgments
\fi

\if@snu@indentoptionset
    \if@snu@indentfirst
	\RequirePackage{indentfirst}
    \fi
\else
    \if@snu@ko
	\RequirePackage{indentfirst}
    \fi
\fi

\RequirePackage{ifpdf}

%% maketitle removed
\let\oldmaketitle=\maketitle
\renewcommand\maketitle{}

%% margin setup
%% a4paper : 210 mm X 297 mm
%% B5 (ISO) : 176 mm X 250 mm
%% B5 (JIS) : 182 mm X 257 mm
%% 4X6배판 : 188 mm X 258 mm; SNU Library specifies 190 mm X 260 mm

% SNU library rules for page margin:
% left-right margins 3.0 cm
% top margin 2 cm, bottom margin 1.5 cm
% but bottom page margin needs to include space for page numbers so set to 2.0-2.5 cm

\if@snu@under
	\setlength{\paperwidth}{210mm}
	\setlength{\paperheight}{297mm}
	\setlength{\textwidth}{160mm} %% 210 mm - (2.5 cm)*2
	\setlength{\textheight}{257mm} %% 297 mm - 3 cm - 3.5 cm
\else
	\if@snu@fsbp
		\setlength{\paperwidth}{190mm} % 188 -> 190
		\setlength{\paperheight}{260mm} %258 -> 260
		\setlength{\textwidth}{130mm} %% 188 - 30*2 = 128. Update: 190 mm - (30 mm)*2 = 130
		\setlength{\textheight}{210mm} %% 258 - 20 - 25 = 213. Update: 260 - 20 - 25 = 215. Update v 1.2: 260 - 20 - 30 = 210
	\else
		\setlength{\paperwidth}{182mm}
		\setlength{\paperheight}{257mm}
		\setlength{\textwidth}{122mm} %% 182 mm - (2.5 cm)*2
		\setlength{\textheight}{192mm} %% 257 mm - 3 cm - 3.5 cm
	\fi
\fi

\setlength{\topmargin}{20mm} % default is 30
\addtolength{\topmargin}{-1in}
\setlength{\headheight}{0mm}
\setlength{\headsep}{0mm} 
\addtolength{\marginparwidth}{-1.2cm} 
%\setlength{\marginparsep}{3mm} 
\setlength{\oddsidemargin}{30mm} % default is 25
\addtolength{\oddsidemargin}{-1in}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\footskip}{12mm} % page number location: middle of bottom page margin: 30/2 = 15 in this case 
% (Update v.1.2: top and bottom of paper is cut slightly when printed, need to consider this)
% 15 - 3 = 12
\ifpdf
	\setlength{\pdfpagewidth}{\paperwidth}
	\setlength{\pdfpageheight}{\paperheight}
\fi


%% Line spacing
\if@snu@under
	%% 배행간 설정이 조금 까다롭다.
	%% 영문은 1.6으로 하고, 한글은 1.75나 2.0으로 해야 한다는 주장도 있다.
	%% SNU library rule only specifies line spacing to be >= 1.7
	\linespread{1.75} % Doblespacing
\else
	\if@snu@ko
	\linespread{1.75} %
	\else
	\linespread{1.75} %
	\fi
\fi
\let\@snu@oldfootnote=\footnote
\renewcommand{\footnote}[1]{\linespread{1.0}\@snu@oldfootnote{#1}\linespread{1.75}} %back to old linespread after footnote

%% Title
\let\@oldtitle=\title
\def\title{\@ifstar\@snu@title\@oldtitle}
\def\@snu@title#1{\gdef\@titlealt{#1}}
\def\@titlealt{\@latex@error{No \noexpand\title* given}\@ehc}
%\@onlypreamble{\title}

%% Academic subject
\def\academicko#1{\gdef\@snu@academic@ko{#1}}
\def\@snu@academic@ko{이학}

%% School
\def\schoolko#1{\gdef\@snu@school@ko{#1}}
\def\schoolen#1{\gdef\@snu@school@en{#1}}
\def\schoolensub#1{\gdef\@snu@school@ensub{#1}} % 불필요?
\if@snu@under
	\def\@snu@school@ko{서울대학교 공과대학}
\else
	\def\@snu@school@ko{서울대학교 대학원}
\fi
\def\@snu@school@en{COLLEGE OF ENGINEERING}
\def\@snu@school@ensub{SEOUL NATIONAL UNIVERSITY}
%onlypreamble{\schoolko}
%onlypreamble{\schoolen}
%onlypreamble{\schoolensub}

%% Department
\def\departmentko#1{\gdef\@snu@department@ko{#1}}
\def\departmenten#1{\gdef\@snu@department@en{#1}}
\def\@snu@department@ko{unused}
\def\@snu@department@en{unused}
%\@onlypreamble{\departmentko}
%\@onlypreamble{\departmenten}
\def\bachelors#1{\gdef\@snu@bachelors{#1}}
\def\masters#1{\gdef\@snu@masters{#1}}
\def\bsyear#1{\gdef\@snu@bsyear{#1}}
\def\msyear#1{\gdef\@snu@msyear{#1}}

%% Name
\let\@oldauthor=\author
\def\author{\@ifstar\@snu@authoralt\@oldauthor}
\def\@snu@authoralt#1{\gdef\@authoralt{#1}}
\def\@authoralt{\@latex@error{No \noexpand\author* given}\@ehc}
%\@onlypreamble{\author}
\def\authorallcaps#1{\gdef\@snu@authorallcaps{#1}}
\def\allcapstitle#1#2#3{%
	\gdef\@snu@allcapstitleLA{#1}
	\gdef\@snu@allcapstitleLB{#2}
	\gdef\@snu@allcapstitleLC{#3}	
}
\def\@snu@allcapstitleLA{}
\def\@snu@allcapstitleLB{}
\def\@snu@allcapstitleLC{}
	
%% Student ID
\def\studentnumber#1{\gdef\@snu@studentnumber{#1}}
\def\@snu@studentnumber{\@latex@error{No \noexpand\studentnumber given}\@ehc}
%\@onlypreamble{\studentnumber}

%% Advisor
\def\advisor{\@ifstar\@snu@advisoralt\@snu@advisor}
\def\@snu@advisoralt#1{\gdef\@advisoralt{#1}}
\def\@snu@advisor#1{\gdef\@advisor{#1}}
\def\@advisoralt{\@latex@error{No \noexpand\advisor* given}\@ehc}
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}
%\@onlypreamble{\advisor}

%% Date degree granted
%% graddate: Korean date, enddate: English date
\def\graddate#1{\gdef\@snu@graddate{#1}}
\def\@snu@graddate{\@latex@error{No \noexpand\graddate given}\@ehc}
%\@onlypreamble{\graddate}
\def\endate#1{\gdef\@snu@endate{#1}}
\def\gradyear#1{\gdef\@snu@gradyear{#1}}

%% Defense date - for defense manuscript cover
\def\defensedate#1{\gdef\@snu@defensedate{#1}}
\def\@snu@defensedate{\@latex@error{No \noexpand\defensedate given}\@ehc}

%% Submission date
\def\submissiondate#1{\gdef\@snu@submissiondate{#1}}
\def\@snu@submissiondate{\@latex@error{No \noexpand\submissiondate given}\@ehc}
%\@onlypreamble{\submissiondate}

%% Approval date
\def\approvaldate#1{\gdef\@snu@approvaldate{#1}}
\def\@snu@approvaldate{\@latex@error{No \noexpand\approvaldate given}\@ehc}
%\@onlypreamble{\approvaldate}

%% Committee
\def\committeemembers#1#2#3#4#5{%
	\gdef\@snu@committeememberA{#1}
	\gdef\@snu@committeememberB{#2}
	\gdef\@snu@committeememberC{#3}
	\gdef\@snu@committeememberD{#4}
	\gdef\@snu@committeememberE{#5}
}
\def\@snu@committeememberA{}
\def\@snu@committeememberB{}
\def\@snu@committeememberC{}
\def\@snu@committeememberD{}
\def\@snu@committeememberE{}

\def\encommitteemembers#1#2#3#4#5{%
	\gdef\@snu@encommitteememberA{#1}
	\gdef\@snu@encommitteememberB{#2}
	\gdef\@snu@encommitteememberC{#3}
	\gdef\@snu@encommitteememberD{#4}
	\gdef\@snu@encommitteememberE{#5}
}
\def\@snu@encommitteememberA{}
\def\@snu@encommitteememberB{}
\def\@snu@encommitteememberC{}
\def\@snu@encommitteememberD{}
\def\@snu@encommitteememberE{}

%% Contact
\def\phonenumber#1{\gdef\@snu@phonenumber{#1}}

%% Date for copyright agreement (unuseD)
\def\agreementdate#1{\gdef\@snu@agreementdate{#1}}

%% Copied def. of \cleardoublepage from memoir.cls
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  %\hbox{}\thispagestyle{cleared}%
  \hbox{}\thispagestyle{empty}%
  \newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}


%% 발표용 표지 (최종)
\def\presentation#1{\gdef\@snu@presentation{#1}}
\newlength{\@snu@covertextheight}
\setlength{\@snu@covertextheight}{\textheight}
\addtolength{\@snu@covertextheight}{-20mm} % originally -10, since textheight went from 193 to 213 need more
\newcommand{\makefrontcover}{%
	%% 여백 재조정
	\cleardoublepage
	\addtolength{\topmargin}{10mm} % and adjust top margin from 20 to 30 mm for the cover
	\addtolength{\textwidth}{10mm}
	\addtolength{\oddsidemargin}{-5mm}
	\addtolength{\evensidemargin}{-5mm}
	\if@twocolumn \@restonecoltrue
	\else \@restonecolfalse \fi
	\onecolumn
	%\enlargethispage{5mm} % removed in version 0.99
	\thispagestyle{empty}
	\noindent
	%\begin{minipage}[][\@snu@covertextheight][s]{\textwidth}
	\parbox[][\@snu@covertextheight][s]{\textwidth}{%
		\centering
		\normalfont
		\linespread{1.3}\selectfont
		\if@snu@under % 학부
			\fontsize{16pt}{16pt}\selectfont
			공학학사학위논문\\
			\vspace{2cm}\nointerlineskip
			\fontsize{21pt}{21pt}\selectfont
			\@title\\
			\vfill
			\fontsize{16pt}{16pt}\selectfont
			\@snu@defensedate\\
			\vspace{4cm}\nointerlineskip
			\@snu@school@ko\\
			\vspace{1cm}\nointerlineskip
			\@snu@department@ko\\
			\vspace{1cm}\nointerlineskip
			\@authoralt
		\else % 대학원
			\fontsize{12pt}{12pt}\selectfont
			\if@snu@ms
				\@snu@koen{\@snu@academic@ko석사학위논문}%
				{M.S. THESIS}\\
			\else
				\@snu@koen{\@snu@academic@ko박사학위논문}%
				{이학박사 학위논문 \@snu@presentation 발표 원고}\\
			\fi
			\vspace{1.5cm}\nointerlineskip
			\fontsize{20pt}{20pt}\selectfont
			\@title\\
			\vspace{1cm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
			\@titlealt\\
			\vspace{1.5cm}\nointerlineskip
			\fontsize{14pt}{14pt}\selectfont
			지도교수~~~\@advisoralt\\
			\vspace{1.5cm}\nointerlineskip
			%\if@snu@ko\else
			%	\vspace{2cm}\nointerlineskip
			%	\fontsize{14pt}{14pt}\selectfont
			%	BY\\
			%	\vspace{1cm}\nointerlineskip
			%	\@author
			%\fi
			%\vfill
			\fontsize{14pt}{14pt}\selectfont
			\@snu@defensedate\\
			\vspace{1.5cm}\nointerlineskip
			\if@snu@ko
				\fontsize{14pt}{14pt}\selectfont
				\@snu@school@ko\\
				\vspace{5mm}\nointerlineskip
				\fontsize{14pt}{14pt}\selectfont
				\@snu@department@ko\\
				\vspace{5mm}\nointerlineskip
				\fontsize{14pt}{14pt}\selectfont
				\@authoralt
			\else
				\fontsize{14pt}{14pt}\selectfont
				\@snu@school@ko\\
				\vspace{5mm}\nointerlineskip
			    \fontsize{14pt}{14pt}\selectfont
				\@snu@department@ko\\
			    \vspace{5mm}\nointerlineskip
				\fontsize{14pt}{14pt}\selectfont
				\@authoralt
			\fi
			\vfill
			\begin{tabular}[b]{cc}
			위 \hfill 원 \hfill 장 & ~\@snu@committeememberA\vspace{11pt}\\
			부위원장               & ~\@snu@committeememberB\vspace{11pt}\\
			위 \hfill 원           & ~\@snu@committeememberC\vspace{11pt}\\
			위 \hfill 원           & ~\@snu@committeememberD\vspace{11pt}\\
			위 \hfill 원           & ~\@snu@committeememberE\\
			\end{tabular}
		\fi
	}
	%\end{minipage}
	%% 여백 원래대로
	\newpage
	\addtolength{\topmargin}{-10mm} % and adjust top margin from 20 to 30 mm for the cover
	\addtolength{\textwidth}{-10mm}
	\addtolength{\oddsidemargin}{5mm}
	\addtolength{\evensidemargin}{5mm}
	\if@restonecol \twocolumn \fi
}


%% HardCover Design (default)
%% 표지 하단 여백은 3 cm (5 mm 작음) %top bottom margin 20 rule says 30 for cover
%% 표지 좌우 여백은 2 cm (5 mm 작음) %
\newcommand{\hardcover}{%
	%% 여백 재조정
	\cleardoublepage
	\addtolength{\topmargin}{10mm} % and adjust top margin from 20 to 30 mm for the cover
	\addtolength{\textwidth}{10mm}
	\addtolength{\oddsidemargin}{-5mm}
	\addtolength{\evensidemargin}{-5mm}
	\if@twocolumn \@restonecoltrue
	\else \@restonecolfalse \fi
	\onecolumn
	%\enlargethispage{5mm} % removed at version 0.99
	\thispagestyle{empty}
	\noindent
	%\begin{minipage}[][\@snu@covertextheight][s]{\textwidth}
	\parbox[][\@snu@covertextheight][s]{\textwidth}{%
		\centering
		\normalfont
		\linespread{1.3}\selectfont
			\fontsize{14pt}{14pt}\selectfont
				\@snu@koen{\@snu@academic@ko박사학위논문}%
				{이학박사학위논문}\\
			\vspace{2cm}\nointerlineskip
			\fontsize{22pt}{22pt}\selectfont
			\@title\\
			\vspace{1cm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
			\@titlealt\\
			\vfill
			\fontsize{14pt}{14pt}\selectfont
			\@snu@graddate\\
			\vspace{4cm}\nointerlineskip
				\fontsize{16pt}{16pt}\selectfont
				\@snu@school@ko\\
				\vspace{5mm}\nointerlineskip
			    \fontsize{14pt}{14pt}\selectfont
				\@snu@department@ko\\
			    \vspace{5mm}\nointerlineskip
				\fontsize{16pt}{16pt}\selectfont
				\@authoralt
	}
	\newpage
	\addtolength{\topmargin}{-10mm} % and adjust top margin from 20 to 30 mm for the cover
	\addtolength{\textwidth}{-10mm}
	\addtolength{\oddsidemargin}{5mm}
	\addtolength{\evensidemargin}{5mm}
	\if@restonecol \twocolumn \fi
}


%% HardCover Design (custom-designed by S. Moon)
\newcommand{\hardcoveren}{%
	\cleardoublepage
	\addtolength{\topmargin}{10mm} % and adjust top margin from 20 to 30 mm for the cover
	\addtolength{\textwidth}{10mm}
	\addtolength{\oddsidemargin}{-5mm}
	\addtolength{\evensidemargin}{-5mm}
	\if@twocolumn \@restonecoltrue
	\else \@restonecolfalse \fi
	\onecolumn
	\thispagestyle{empty}
	\noindent
	\parbox[][\@snu@covertextheight][s]{\textwidth}{%
		\centering
		\normalfont
		\linespread{1.3}\selectfont
		\fontsize{13.2pt}{13.2pt}\selectfont
		\@snu@koen{\@snu@academic@ko박사학위논문}%
		{Ph.D. Dissertation}\\
		\vspace{2cm}\nointerlineskip
		\fontsize{16pt}{16pt}\selectfont
		\textsc{\@snu@allcapstitleLA \\\@snu@allcapstitleLB \\\@snu@allcapstitleLC}\\
		\vspace{1cm}\nointerlineskip
		\fontsize{14pt}{14pt}\selectfont
		\@titlealt\\
		\vfill
		\fontsize{13.2pt}{13.2pt}\selectfont
		\@snu@endate\\
		\vspace{4cm}\nointerlineskip
		\fontsize{14pt}{14pt}\selectfont
		\textsc{SEOUL NATIONAL UNIVERSITY}\\
		\vspace{0.5cm}\nointerlineskip
		\fontsize{13.2pt}{13.2pt}\selectfont
		School of Earth and Environmental Sciences\\
		\vspace{1.5cm}\nointerlineskip %0.7cm will place School in the center
		\fontsize{14pt}{14pt}\selectfont
		\textsc{\@snu@authorallcaps}
	}
	\newpage
	\addtolength{\topmargin}{-10mm} % and adjust top margin from 20 to 30 mm for the cover
	\addtolength{\textwidth}{-10mm}
	\addtolength{\oddsidemargin}{5mm}
	\addtolength{\evensidemargin}{5mm}
	\if@restonecol \twocolumn \fi
}


%% Inner Cover (English with committee member names) --- no jadae
\newcommand{\makefrontcoveren}{%
	%% 여백 재조정
	\cleardoublepage
	\addtolength{\topmargin}{10mm} % and adjust top margin from 20 to 30 mm for the cover
	\addtolength{\textwidth}{10mm}
	\addtolength{\oddsidemargin}{-5mm}
	\addtolength{\evensidemargin}{-5mm}
	\if@twocolumn \@restonecoltrue
	\else \@restonecolfalse \fi
	\onecolumn
	%\enlargethispage{5mm} % removed at version 0.99
	\thispagestyle{empty}
	\noindent
%	\begin{minipage}[][\@snu@covertextheight][s]{\textwidth}
	\parbox[][\@snu@covertextheight][s]{\textwidth}{%
		\centering
		\normalfont
		\vspace{1cm}
		\linespread{1.3}\selectfont
			\fontsize{20pt}{20pt}\selectfont %default is 22, but it seemed too large for this font?
			\@title\\
%High-Dimensional Lorenz Systems, Atmospheric Predictability, and Data Assimilation\\
			\vspace{1.6cm}\nointerlineskip
				\fontsize{14pt}{14pt}\selectfont
				by\\
			\vspace{0.6cm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
				\@author\\
			\vspace{0.6cm}\nointerlineskip
			\fontsize{14pt}{14pt}\selectfont
				B.S., \@snu@bachelors, \@snu@bsyear\\
				M.S., \@snu@masters, \@snu@msyear\\
			%\vspace{2cm}\nointerlineskip
			\vfill
				\fontsize{14pt}{14pt}\selectfont
				A Dissertation Submitted to the Faculty of the\\Graduate School of Seoul National University in\\Partial Fulfillment of the Requirements for the\\Degree of Doctor of Philosophy\\
			\vspace{1.8cm}\nointerlineskip
			\fontsize{14pt}{14pt}\selectfont
				\@snu@endate\\
			\vspace{1.6cm}\nointerlineskip
			%\vfill
			\linespread{1.4}\fontsize{14pt}{14pt}\selectfont
			\raggedright{Advisory Committee:}\\
			\vspace{0.4cm}\nointerlineskip
			\hspace{1.6cm}\@snu@encommitteememberA\\
			\hspace{1.6cm}\@snu@encommitteememberB\\
			\hspace{1.6cm}\@snu@encommitteememberC\\
			\hspace{1.6cm}\@snu@encommitteememberD\\
			\hspace{1.6cm}\@snu@encommitteememberE
	}
	%\end{minipage}
	%% 여백 원래대로
	\newpage
	\addtolength{\topmargin}{-10mm} % and adjust top margin from 20 to 30 mm for the cover
	\addtolength{\textwidth}{-10mm}
	\addtolength{\oddsidemargin}{5mm}
	\addtolength{\evensidemargin}{5mm}
	\if@restonecol \twocolumn \fi
%% 참고사항
%% center enviornment를 사용하면 하단 여백이 안 맞음.
%% 여백 설정이 조금만 어긋나면 페이지가 인쇄되지 않음.
%% minipage와 parbox 중 무엇이 더 나은지 테스트 중.
}

%% Inner Cover (English with committee member names) --- jadae 서울대가 자대인 경우
\newcommand{\makefrontcoverenjadae}{%
	%% 여백 재조정
	\cleardoublepage
	\addtolength{\topmargin}{10mm} % and adjust top margin from 20 to 30 mm for the cover
	\addtolength{\textwidth}{10mm}
	\addtolength{\oddsidemargin}{-5mm}
	\addtolength{\evensidemargin}{-5mm}
	\if@twocolumn \@restonecoltrue
	\else \@restonecolfalse \fi
	\onecolumn
	%\enlargethispage{5mm} % removed at version 0.99
	\thispagestyle{empty}
	\noindent
%	\begin{minipage}[][\@snu@covertextheight][s]{\textwidth}
	\parbox[][\@snu@covertextheight][s]{\textwidth}{%
		\centering
		\normalfont
		\vspace{1cm}
		\linespread{1.3}\selectfont
			\fontsize{20pt}{20pt}\selectfont %default is 22, but it seemed too large for this font?
			\@title\\
			\vspace{1.8cm}\nointerlineskip
				\fontsize{14pt}{14pt}\selectfont
				by\\
			\vspace{1.0cm}\nointerlineskip
			\fontsize{16pt}{16pt}\selectfont
				\@author\\
			%\vfill
			\vspace{2.0cm}\nointerlineskip
				\fontsize{14pt}{14pt}\selectfont
				A Dissertation Submitted to the Faculty of the\\Graduate School of Seoul National University in\\Partial Fulfillment of the Requirements for the\\Degree of Doctor of Philosophy\\
			\vspace{2.0cm}\nointerlineskip
			\fontsize{14pt}{14pt}\selectfont
				\@snu@endate\\
			\vfill
			%\vspace{1.8cm}\nointerlineskip
			\linespread{1.4}\fontsize{14pt}{14pt}\selectfont
			\raggedright{Advisory Committee:}\\
			\vspace{0.5cm}\nointerlineskip
			\hspace{1.6cm}\@snu@encommitteememberA\\
			\hspace{1.6cm}\@snu@encommitteememberB\\
			\hspace{1.6cm}\@snu@encommitteememberC\\
			\hspace{1.6cm}\@snu@encommitteememberD\\
			\hspace{1.6cm}\@snu@encommitteememberE
	}
	%\end{minipage}
	%% 여백 원래대로
	\newpage
	\addtolength{\topmargin}{-10mm} % and adjust top margin from 20 to 30 mm for the cover
	\addtolength{\textwidth}{-10mm}
	\addtolength{\oddsidemargin}{5mm}
	\addtolength{\evensidemargin}{5mm}
	\if@restonecol \twocolumn \fi
}

%% Colophon
%% Publications
\def\publications#1#2#3#4#5{%
	\gdef\@snu@publicationA{#1}
	\gdef\@snu@publicationB{#2}
	\gdef\@snu@publicationC{#3}
	\gdef\@snu@publicationD{#4}
	\gdef\@snu@publicationE{#5}
}
\def\@snu@publicationA{}
\def\@snu@publicationB{}
\def\@snu@publicationC{}
\def\@snu@publicationD{}
\def\@snu@publicationE{}
%% contact info
\def\cvlink#1{\gdef\@snu@cvlink{#1}}
\newcommand{\makecolophon}{%
\thispagestyle{empty}
\null\vfill

\settowidth\longest{The manuscript printed and bound in the present form}
\begin{center}
	\parbox{\longest}{%
		\begingroup
		\tiny\centering
		\includegraphics[trim=150 200 150 300, clip, width=2cm]{./snu.eps}
		
		Copyright {\copyright} {\@snu@gradyear} by \@author
		
		All rights reserved.
		\vspace{\baselineskip}
		
		The manuscript printed and bound in the present form is intended for personal use and distribution among the author's colleagues, friends, and family.
		\vspace{\baselineskip}
		
		An electronic copy of the document has been submitted to the Seoul National University Library with minor formatting adjustments\\in compliance with the University's requirements.
		\vspace{\baselineskip}
		
		This dissertation contains contents of the following journal publications: 
		
		\@snu@publicationA 
		
		\@snu@publicationB 
		
		\@snu@publicationC 
		
		\@snu@publicationD 
		
		\@snu@publicationE
		
		List valid at the time of submission---Material from the dissertation may produce one or more additional publications in the future.
		\vspace{\baselineskip}
		
		\emph{A catalogue record is available from the National Library of Korea}
		\vspace{\baselineskip}
		
		Typeset with {\LaTeX} using cumg-template based on zeta709's snuthesis class
		
		To view the author's profile, visit
		
		\texttt{\@snu@cvlink}\vspace{\baselineskip}

		Printed in South Korea\\1 3 5 7 8 6 4 2
		
		\endgroup
	}

\end{center}
\vfill\vfill
}





%% 인준지
%% 인준지 하단 여백 2 cm (15 mm 작음)
\newlength{\@snu@approvaltextheight}
\setlength{\@snu@approvaltextheight}{\textheight}
%\addtolength{\@snu@approvaltextheight}{15mm}
%\addtolength{\@snu@approvaltextheight}{10mm}
%% underline length
\newlength{\committeenameunderlinelength}
\setlength{\committeenameunderlinelength}{7cm}
\newlength{\@snu@underlinetmp}
\newlength{\@snu@underlinetmpb}
\newcommand{\committeestyle}[1]{%
	\setlength{\@snu@underlinetmp}{\committeenameunderlinelength}%
	\settowidth{\@snu@underlinetmpb}{#1}%
	\addtolength{\@snu@underlinetmp}{-\@snu@underlinetmpb}%
	\divide \@snu@underlinetmp by 2 %
	\underline{\hspace{\@snu@underlinetmp}#1\hspace{\@snu@underlinetmp}}%
}
%\newcommand{\@snu@nameline}{\underline{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}}
\newcommand{\makeapproval}{%
%	\cleardoublepage
	\if@twocolumn \@restonecoltrue
	\else \@restonecolfalse \fi
	\onecolumn
	%\enlargethispage{15mm}
	\enlargethispage{10mm} % modified at version 0.99
	\thispagestyle{empty}
	\noindent
	
	\newpage
	\if@restonecol \twocolumn \fi
}

%%\newcommand{\@lastPage}{\pageref{paperlastpagelabel}}

%% keyword
\newcommand{\@snu@keyword}{}
\newcommand{\keyword}[1]{\renewcommand{\@snu@keyword}{#1}}

\def\phantomsection{}

%% abstract
\renewenvironment{abstract}{%
	\if@snu@ko
		\chapter*{\abstractname}
		\@mkboth{\MakeUppercase\abstractname}%
			{\MakeUppercase\abstractname}%
		\addcontentsline{toc}{chapter}{\abstractname}%
	\else
		\if@openright \cleardoublepage
		\else \clearpage \fi
		\@afterindentfalse
		\phantomsection
		\addcontentsline{toc}{chapter}{\abstractname}
		{%
			\centering
			\normalfont
			\linespread{1.0}
			\fontsize{12pt}{12pt}\selectfont
			\textbf{\abstractname}\par\nobreak
		}
		\vspace{12pt}
		\@afterheading
	\fi
}{%
	\vfill\vspace*{\fill}
	% better than "\vfill", "\null\vfill", \vspace*{0pt}\vfill", etc.
	\noindent
	{\bfseries \keywordname}:~\@snu@keyword
	\if@snu@under\else
	\\
	\noindent
	{\bfseries \studentnumbername}:~\@snu@studentnumber
	\fi
	\newpage
}


%% keywordalt
\newcommand{\@snu@keywordalt}{}
\newcommand{\keywordalt}[1]{\renewcommand{\@snu@keywordalt}{#1}}

%% abstractalt
\newenvironment{abstractalt}%
{%
	\if@snu@ko
		\chapter*{\abstractnamealt}
		\@mkboth{\MakeUppercase\abstractnamealt}%
			{\MakeUppercase\abstractnamealt}%
		\addcontentsline{toc}{chapter}{\abstractnamealt}%
	\else
		\chapter*{\abstractnamealt}
		\@mkboth{\MakeUppercase\acknowledgementname}%
			{\abstractnamealt}%
		\addcontentsline{toc}{chapter}{\abstractnamealt}%
	\fi
}{%

	\vfill\vspace*{\fill}
%	\vspace{1cm} % switch with line above to put keywords at the bottom of page
	\noindent
	{\bfseries \keywordnamealt}:~\@snu@keywordalt
	\if@snu@under\else
	\\
	\noindent
	{\bfseries \studentnumbernamealt}:~\@snu@studentnumber
	\fi
  	\newpage
}

%% 감사의 글
\newcommand{\acknowledgement}{%
	\if@snu@ko
		\if@openright \cleardoublepage
		\else \clearpage \fi
		\@afterindentfalse
		\phantomsection
		\addcontentsline{toc}{chapter}{\acknowledgementname} %use \testsf{} for gothic
		{%
%			\centering
			\normalfont
			\linespread{1.0}
			\fontsize{16pt}{16pt}\selectfont
			\textbf{\acknowledgementname}\par\nobreak %use \testsf{} for gothic
		}
		\vspace{2cm}
		\@afterheading
	\else
		\chapter*{\acknowledgementname}
		\@mkboth{\MakeUppercase\acknowledgementname}%
			{\MakeUppercase\acknowledgementname}%
		\addcontentsline{toc}{chapter}{\acknowledgementname}%
	\fi
}

%% Acknowledgments
\newcommand{\acknowledgment}{%
	\if@snu@ko
		\if@openright \cleardoublepage
		\else \clearpage \fi
		\@afterindentfalse
		\phantomsection
		\addcontentsline{toc}{chapter}{\acknowledgmentname}
		{%
			\centering
			\normalfont
			\linespread{1.0}
			\fontsize{16pt}{16pt}\selectfont
			\textbf{\acknowledgmentname}\par\nobreak
		}
		\vspace{2cm}
		\@afterheading
	\else
		\chapter*{\acknowledgmentname}
		\@mkboth{\MakeUppercase\acknowledgmentname}%
			{\MakeUppercase\acknowledgmentname}%
		\addcontentsline{toc}{chapter}{\acknowledgmentname}%
	\fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 캡션 스타일
%% 캡션에서 colon(:)을 제거해야 한다.
%% report 클래스에서 베끼고 :만 지움.
%% 정렬은 알아서 됨.
%% caption의 마지막에 마침표가 있는지 체크
%% 표의 캡션에는 마침표가 없어야 하고
%% 그림의 캡션에는 있어야 함.
%% (반대던가??)
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1 #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1 #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

% 한글 논문과 영문 논문의 서식이 다르다.
% 귀찮지만 따로 만들어야 한다.
\if@snu@ko
    %% adaopted from report class
    %% chapter* style: style of toc, lof, lot, etc.
    \def\@makeschapterhead#1{%
      {%
	\centering
	\normalfont
	\interlinepenalty\@M
	\linespread{1.0}
	\fontsize{22pt}{22pt}\selectfont
	\bfseries #1\par\nobreak
	\vspace{2cm}
      }}
    %% adapted from report class
    %% chapter style
    \def\@makechapterhead#1{%
      {%
	\centering
	\normalfont
	\linespread{1.0}\selectfont
	\ifnum \c@secnumdepth >\m@ne
	    \fontsize{16pt}{16pt}\selectfont
	%    \bfseries \snuchappre\space\thechapter\snuchappost\space
		 \bfseries #1\par\nobreak
	\fi
	\interlinepenalty\@M
	\fontsize{16pt}{16pt}\selectfont
	\bfseries #1\par\nobreak
	\vspace{2cm}
      }}
\else
    %% report 클래스에서 약간 고침
    %% chapter* style: style of toc, lof, lot, etc.
    \def\@makeschapterhead#1{%
      \vspace*{3cm}% 챕터 숫자 위의 공간
      \vspace{-\f@baselineskip} % 정확한 조절을 위해 필요
      {%
	\parindent \z@ \raggedright
	\normalfont
	\interlinepenalty\@M
	\linespread{1.0}
	\fontsize{16pt}{16pt}\selectfont
	\bfseries #1\par\nobreak
	\vspace{2cm} % space below chapter heading
      }}
    %% report 클래스에서 약간 고침
    %% chapter style
    \def\@makechapterhead#1{%
      \vspace*{3cm}% 챕터 숫자 위의 공간
      \vspace{-\f@baselineskip} % 정확한 조절을 위해 필요
      {%
	\parindent \z@ \raggedright \normalfont
%	\linespread{1.0}\selectfont
	\ifnum \c@secnumdepth >\m@ne
	    \fontsize{16pt}{16pt}\selectfont
	%   \bfseries \@chapapp\space \thechapter
	%   \par\nobreak
	%   \vspace{2cm}
		\bfseries\thechapter\space
	\fi
	\interlinepenalty\@M
	\fontsize{16pt}{16pt}\selectfont
	\bfseries #1\par\nobreak
	\vspace{2.0cm}
      }}
\fi

% section style
\renewcommand\section{%
	\@startsection {section}{1}{\z@}%
	{-3.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	{\normalfont\fontsize{14pt}{14pt}\selectfont\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\fontsize{12pt}{12pt}\selectfont\bfseries}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% template과 직접적인 관련이 없는 설정으로 이것저것 대신 해준다.

\if@snu@easy
	% 이것은 KLDP에서 가져왔다.
	% http://faq.ktug.or.kr/faq/pdflatex%B0%FAlatex%B5%BF%BD%C3%BB%E7%BF%EB
	\ifpdf
		\input glyphtounicode\pdfgentounicode=1 %type 1 font사용시
		% \usepackage{dhucs-cmap} % true type 글꼴 사용시
		% \pdfmapfile{+unttf-pdftex-dhucs.map} % truetype글꼴사용시
		\usepackage[pdftex,unicode]{hyperref}
		\usepackage[pdftex]{graphicx}
		\usepackage[pdftex,svgnames]{xcolor}
	\else
		\usepackage[dvipdfmx,unicode]{hyperref}
		\usepackage[dvipdfmx]{graphicx}
		\usepackage[dvipdfmx,svgnames]{xcolor}
	\fi
	%KC2008의 공식예제인 first.tex와 ko.TEX v0.1.0 사용 설명서 참조
	%hangul-ucs 4.0 이전 버전에서는 dhucs-ucshyper라는 부가 패키지가 제공되었으나, 
	%hyperref의 기능 향상에 따라 불필요해졌으므로 
	%ko.TEX에서는 이를 제공하지 않는다.
\fi

%% Last modified by Sungju Moon (sj.moon.math@gmail.com)
%% For use by future members of cumg@snu
%% In final form: 2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Author: zeta709 (zeta709@gmail.com)
%% https://github.com/zeta709/snuthesis
%%
%% # Version history
%% ## 2017
%% * 610a07b, 2017-07-22: Additional macro-fication
%% * 01a6678, 2017-07-22: snueethesis.cls -> snuthesis.cls
%% * 3066490, 2017-07-22: Macro-fied Department/School
%% * 66b5ef0, 2017-07-20: ToC debugging
%% ## 2012
%% * 91fb8fa, 2012-02-27: approval/agreement forms modified
%% * 4cde5a6, 2012-01-19: margin spacing
%% * 75d2641, 2012-01-18: agreement form
%% ## 2011
%% * bd9e972, 2012-01-18: 4x6 paper size
%% * cb304c2, 2011-12-14: approval form
%% * 1e7a8b7, 2011-11-27: git commit
%% * 0000000, 2009-12-17:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% SNU EE Unofficial Template by jdj
%% Based on KAIST Thesis Template (below)
%% ... modified by jdj, to ko.tex
%% ... stripped down redundent codes
%% ... modified margins.
%%
%% @version		0.1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% KAIST Thesis Template for LaTeX
%%
%% @version      0.4
%% @releasedate  Nov 12th, 2004
%%
%% @author       Chae, Seugbyung 채승병
%%               mailto:chess@kaist.ac.kr
%%
%% @requirements
%%    current distribution of teTeX, fpTeX, MikTeX
%%		+ Hangul-ucs 2.6.0 or higher
%%	  (please see http://faq.ktug.or.kr/faq/Hangul-ucs)
%%
%% Karnes Kim, converted to Hangul-ucs version.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% End of file `snuthesis.cls`.
