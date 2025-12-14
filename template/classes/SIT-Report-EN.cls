%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Version 1
%% Author: U. Ruckcharti
%% Date:   10 Sep 2024
%% Email:  ukrit.ruc@sit.kmutt.ac.th ukrit.ruc@kmutt.ac.th
%%
%% Version 2
%% Author: T. Wongabut
%% Date: 23 Nov 2024
%% Email: thanatat.wongab@kmutt.ac.th
%%
%% Version 3
%% Author: T. Wongabut
%% Date: 24 Nov 2024
%% Email: thanatat.wongab@kmutt.ac.th

%%%%%%%%%% Identification 
\ProvidesClass{classes/SIT-Report-EN}[]
\LoadClass[12pt,a4paper,oneside]{report}

%%%%%%%%%Thai Font%%%%%%%%%
\usepackage{fontspec}
\XeTeXlinebreaklocale "th_TH"
\XeTeXlinebreakskip = 0pt plus 1pt
\defaultfontfeatures{Scale=1.21,Mapping=tex-text}
\setmainfont[Mapping=tex-text]{TH Sarabun New}
\renewcommand\baselinestretch{1.2}
\setlength{\parindent}{10mm}
\setlength{\parskip}{1ex}
\setlength{\baselineskip}{1.25em}


\RequirePackage{ifthen} 

\usepackage{verbatim} 
\usepackage{graphicx} 
\usepackage[hidelinks]{hyperref} 
\usepackage{enumitem} 
\usepackage{multirow} 
\usepackage{caption} 
\usepackage{subcaption} 
\usepackage{setspace} 
\usepackage{geometry} 
\usepackage{fancyhdr} 
\usepackage{titlesec} 
\usepackage{titletoc} 
\usepackage{tikz} 
\usepackage{atbegshi} 

\usepackage{fancyvrb} 
\fvset{frame=single,framesep=1mm,framerule=0.5mm}

\newcommand{\quotes}[1]{``#1''} 
\usepackage{wrapfig} 
\usepackage{etoolbox}
\preto\figure{%
  \ifnum\value{figure}=0\addtocontents{lof}{{\vskip-10pt}}\fi
}
\preto\table{
\ifnum\value{table}=0\addtocontents{lot}{{\vskip-10pt}}\fi
}

\usetikzlibrary{shapes,automata, positioning, arrows}
\tikzstyle{topic} = [rectangle, draw, fill=blue!20,text width=8em, text badly centered, node distance=2cm]
\tikzstyle{line} = [draw, -latex',line width=0.75mm]
\tikzstyle{node} = [draw, ellipse,fill=red!20, node distance=3cm]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Page layout %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{3} 
\setcounter{tocdepth}{2} 
\geometry{left=40mm,top=30mm,bottom=20mm,right=20mm} %% Page Margin 

\titleformat{\chapter}[display]{\bfseries\Large}
{\filcenter\chaptertitlename~\thechapter}
{-0.7ex}{\vspace{1ex}\centering}[\vspace{1em}]
\titleformat{\section}[block]{\large\bfseries}{\thesection}{1ex}{}
\titleformat{\subsection}[block]{\normalfont\bfseries}{\thesubsection}{1ex}{}
\titleformat{\subsubsection}[block]{\normalfont\bfseries}{\thesubsubsection}{1ex}{}

\titlespacing{\chapter}{0pt}{-20pt}{0pt}
\titlespacing{\section}{0pt}{0pt}{0pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\titlespacing{\subsubsection}{5mm}{0pt}{0pt}
\titlespacing{\paragraph}{10mm}{0pt}{10pt}
\titlespacing{\subparagraph}{15mm}{0pt}{10pt}

\newcommand\mainmatter{\cleardoublepage\pagenumbering{arabic}}
\newcommand\frontmatter{\cleardoublepage\pagenumbering{roman}}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{plain}{
	\fancyhead{}
	\fancyhf{}
	\fancyhead[R]{\thepage}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}
%%%%%%%%% Table of Contents layout %%%%%%%%%

\newcommand{\contenttopchapter}{\textbf{CHAPTER}}
\newcommand{\contenttoppage}{\textbf{PAGE}}
\newcommand{\contenttopfigure}{Figure}
\newcommand{\contenttoptable}{Table}
\newcommand{\contenttopcontinued}{\textbf{ (CONT.)}}
\renewcommand\bibname{References}

\titlecontents{chapter}[0pt]{}{\bfseries\chaptername~\thecontentslabel~~}
	{\bfseries\thecontentslabel}{\bfseries\titlerule*[.25pc]{.}\contentspage}

\titlecontents{section}[25pt]{}{\thecontentslabel~~}
    {\thecontentslabel}{\titlerule*[.25pc]{.}\contentspage}
    
\titlecontents{subsection}[50pt]{}{\thecontentslabel~~}
	{\thecontentslabel}{\titlerule*[.25pc]{.}\contentspage}

\titlecontents{subsubsection}[65pt]{}{\thecontentslabel~~}
    {\thecontentslabel}{\titlerule*[.25pc]{.}\contentspage}

\titlecontents{paragraph}[80pt]{}{\thecontentslabel~~}
    {\thecontentslabel}{\titlerule*[.25pc]{.}\contentspage}

\titlecontents{subparagraph}[90pt]{}{\thecontentslabel~~}
    {\thecontentslabel}{\titlerule*[.25pc]{.}\contentspage}

\titlecontents{figure}[0pt]{}{\figurename~\thecontentslabel~~}
	{\figurename}{\titlerule*[.25pc]{.}\contentspage}

\titlecontents{table}[0pt]{}{\tablename~\thecontentslabel~~}
    {\tablename}{\titlerule*[.25pc]{.}\contentspage}

\newcommand{\ContentsHeader}[4]{
	\chapter*{#1#2} \noindent #3 \hfill #4\par\kern.5\baselineskip
}
\newcommand{\ContentsHeaderContinued}{\ContentsHeader{\contentsname}{\contenttopcontinued}{\contenttopchapter}{\contenttoppage}}
\newcommand{\LofHeaderContinued}{\ContentsHeader{\listfigurename}{\contenttopcontinued}{\contenttopfigure}{\contenttoppage}}
\newcommand{\LotHeaderContinued}{\ContentsHeader{\listtablename}{\contenttopcontinued}{\contenttoptable}{\contenttoppage}}

\renewcommand{\tableofcontents}{
	\AtBeginShipout{\ContentsHeaderContinued}
	\cleardoublepage
	\begingroup
	\ContentsHeader{\contentsname}{}{\contenttopchapter}{\contenttoppage}
	\addcontentsline{toc}{chapter}{CONTENTS}
	\@starttoc{toc}
	\endgroup
	\renewcommand{\ContentsHeaderContinued}{}
}


\renewcommand{\listoffigures}{
    \AtBeginShipout{\LofHeaderContinued}
	\cleardoublepage
	\begingroup
	\ContentsHeader{\listfigurename}{}{\contenttopfigure}{\contenttoppage}
	\addcontentsline{toc}{chapter}{LIST OF FIGURES}
	%\setlength{\baselineskip}{-10pt}
	\@starttoc{lof}
    \endgroup
    \renewcommand{\LofHeaderContinued}{}
}
\renewcommand{\listoftables}{
    \AtBeginShipout{\LotHeaderContinued}
	\cleardoublepage
	\begingroup
	\ContentsHeader{\listtablename}{}{\contenttoptable}{\contenttoppage}
	\addcontentsline{toc}{chapter}{LIST OF TABLES}
	\renewcommand{\baselinestretch}{-1.0}
	\@starttoc{lot}
    \endgroup
    \renewcommand{\LotHeaderContinued}{}
}

%%%%%%%%%Macro Definitions %%%%%%%%%

\newcommand{\@crest}{\includegraphics[width=3cm]{classes/KMUTT_logo.jpg}}
\newcommand{\crest}[1]{\renewcommand{\@crest}{#1}}

%%KMUTT
\newcommand{\@universityEN}{King Mongkut’s University of Technology Thonburi}
\newcommand{\universityEN}[1]{\renewcommand{\@universityEN}{#1}}
\newcommand{\@universityTH}{มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี}
\newcommand{\universityTH}[1]{\renewcommand{\@universityTH}{#1}}

%% School
\newcommand{\@facultyEN}{School of Information Technology}
\newcommand{\facultyEN}[1]{\renewcommand{\@facultyEN}{#1}}
\newcommand{\@facultyTH}{คณะเทคโนโลยีสารสนเทศ}
\newcommand{\facultyTH}[1]{\renewcommand{\@facultyTH}{#1}}

%% Degree
\newcommand{\@degree}{}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}
\newcommand{\@degreeTH}{}
\newcommand{\degreeTH}[1]{\renewcommand{\@degreeTH}{#1}}

%% Major
\newcommand{\@majorProgramEN}{}
\newcommand{\majorProgramEN}[1]{\renewcommand{\@majorProgramEN}{#1}}
\newcommand{\@majorProgramTH}{}
\newcommand{\majorProgramTH}[1]{\renewcommand{\@majorProgramTH}{#1}}

%% Title Thai
\newcommand{\@titleTH}{}
\newcommand{\titleTH}[1]{\renewcommand{\@titleTH}{#1}}

%% Owner
\newcommand{\@authorTwo}{}
\newcommand{\authorTwo}[1]{\renewcommand{\@authorTwo}{#1}}
\newcommand{\@authorThree}{}
\newcommand{\authorThree}[1]{\renewcommand{\@authorThree}{#1}}

%% Submission TH-EN
\newcommand{\submissiontext}{วิทยานิพนธ์นี้เป็นส่วนหนึ่งของการศึกษาตามหลักสูตร}
\newcommand{\@academicyear}{2560}
\newcommand{\academicyear}[1]{\renewcommand{\@academicyear}{#1}}
\newcommand{\submissiontextEN}{A Thesis Submitted in Partial Fulfillment of the Requirements for}
\newcommand{\@academicyearEN}{2024}
\newcommand{\academicyearEN}[1]{\renewcommand{\@academicyearEN}{#1}}
%% Advisor
\newcommand{\@majoradvisor}{}
\newcommand{\majoradvisor}[1]{\renewcommand{\@majoradvisor}{#1}}
\newcommand{\@coadvisor}{}
\newcommand{\coadvisor}[1]{\renewcommand{\@coadvisor}{#1}}

%% Comitttee
\newcommand{\@committeeOne}{}
\newcommand{\committeeOne}[1]{\renewcommand{\@committeeOne}{#1}}
\newcommand{\@committeeTwo}{}
\newcommand{\committeeTwo}[1]{\renewcommand{\@committeeTwo}{#1}}
\newcommand{\@committeeThree}{}
\newcommand{\committeeThree}[1]{\renewcommand{\@committeeThree}{#1}}

%%%%%%%%%Title Page%%%%%%%%%
\renewcommand{\maketitle}{
    \thispagestyle{empty}
    \maketitleinner
    \clearpage
	\newpage
	\thispagestyle{empty}
	\mbox{}
	\clearpage
}

\newcommand{\maketitleinner}{
\begin{doublespacing}
    \begin{center}
        \renewcommand{\baselinestretch}{1.25}

        {\@crest\par}
        \vspace*{.5ex}
        {\large\bfseries{\MakeUppercase{\@title}}\par}
        \vfill
        {\large\bfseries{\MakeUppercase{\@author}}\par}
        \ifthenelse{\equal{\@authorTwo}{}}{}{{\large\bfseries{\MakeUppercase{\@authorTwo}}\par}}
        \ifthenelse{\equal{\@authorThree}{}}{}{{\large\bfseries{\MakeUppercase{\@authorThree}}\par}}
        \vfill

        {\large\bfseries{\MakeUppercase{\submissiontextEN}}\par}
        {\large\bfseries{THE DEGREE OF }{\MakeUppercase{\@degree}} ({\MakeUppercase{\@majorProgramEN}})\par}
        {\large\bfseries{\MakeUppercase{\@facultyEN}}\par}
        {\large\bfseries{\MakeUppercase{\@universityEN}}\par}
        {\large\bfseries{{\@academicyear}}\par}
    \end{center}
\end{doublespacing}
}

\newcommand{\makeapproval}{
\cleardoublepage
\begin{onehalfspacing}
	\begin{center}
		\textbf{\@title}\par
		\vfill
		\@author\par
		\ifthenelse{\equal{\@authorTwo}{}}{}{\@authorTwo\par}
		\ifthenelse{\equal{\@authorThree}{}}{}{\@authorThree\par}
		\vfill
		\submissiontextEN\par
		{The Degree of }{\@degree} ({\@majorProgramEN})\par
		{\@facultyEN}\par
		{\@universityEN}\par
		{Academic Year \@academicyear}\par
		\vspace{0.75cm}
		\hrule height .7pt
		\vspace{1em}	
	\end{center}

	\begin{flushleft}
		\begin{tabular*}{\textwidth}{@{}p{.49\textwidth}p{.49\textwidth}@{}}
			\textbf{Thesis Committee} & {} \\
			\vspace*{1em} & {}\\
			{\makebox[4cm]{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}} & {Chairman} \\ 
			(\@majoradvisor) & {} \\
			{} & {} \\
			% \vspace*{0.5em} & \\
			{\makebox[4cm]{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}} & {Co-Chairman} \\ 
			(\@coadvisor) & {} \\
			{} & {} \\% \vspace*{0.5em} & \\
			{\makebox[4cm]{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}} & {Member} \\ 
			(\@committeeOne) & {} \\
			{} & {} \\% \vspace*{0.5em} & \\
			{\makebox[4cm]{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}} & {Member} \\ 
			(\@committeeTwo) & {} \\
			{} & {} \\% \vspace*{0.5em} & \\
			{\makebox[4cm]{\leavevmode\xleaders\hbox{.}\hfill\kern0pt}} & {Member} \\ 
			(\@committeeThree) & {} \\
			
		\end{tabular*}
	\end{flushleft}
	\noindent
	% \vspace{7em}\\
	\vfill
	\begin{center}
		{\large\bfseries{Copyright Reserved}\par}
	\end{center}
\end{onehalfspacing}
}

%%%%%%%%%% Abstract %%%%%%%%%
\renewenvironment{abstract}{
\cleardoublepage
\begin{onehalfspacing}
\begin{flushleft}
    \begin{tabular*}{\textwidth}{@{}p{.17\textwidth}p{.70\textwidth}@{}}
        \textbf{Thesis Title}& {\@title} \\
        \textbf{Thesis Credits} & {6}\\
        \textbf{Candidates}& {\@author} \\
		\ifthenelse{\equal{\@authorTwo}{}}{}{{}& {\@authorTwo} \\}
		\ifthenelse{\equal{\@authorThree}{}}{}{{}& {\@authorThree} \\}
		\textbf{{Thesis Advisor}}& {\@majoradvisor} \\
		\ifthenelse{\equal{\@coadvisor}{}}{}{{}& {\@coadvisor} \\}
		\textbf{Program}& \@degree \\
		\textbf{Field of Study}& \@majorProgramEN \\
		\textbf{Faculty}& \@facultyEN \\
		\textbf{Academic Year}& \@academicyear \\
    \end{tabular*}
\end{flushleft}
\end{onehalfspacing}
\hrule height .7pt
\vspace{2em}
\begingroup
	\let\clearpage\relax
	\chapter*{Abstract}
	\addcontentsline{toc}{chapter}{ABSTRACT}
\endgroup
}

%%%%%%%%% Thesis Acknowledgements %%%%%%%%%
\newenvironment{acknowledgements}{
\cleardoublepage
\chapter*{Acknowledgement}
\addcontentsline{toc}{chapter}{ACKNOWLEDGEMENT}
\begingroup}{
\vspace{1em}
\vfill
\endgroup
\newpage
}

%%%%%%%%% Abbreviations and Symbols  %%%%%%%%%

\newenvironment{abbreviations}
{
    \cleardoublepage
    \onecolumn
    \chapter*{\centering Vocabularies and Abbreviations}
    \addcontentsline{toc}{chapter}{LIST OF TECHNICAL VOCABULARY AND ABBREVIATION}
    \begingroup
    }{
    \vfill
	\endgroup
}

\newenvironment{symbols}
{
    \cleardoublepage
    \onecolumn
    \chapter*{\centering List of Symbols}
    \addcontentsline{toc}{chapter}{LIST OF SYMBOLS}
    \begingroup
    }{
    \vfill
    \endgroup
}


%%%%%%%%% Appendices  %%%%%%%%%
\usepackage{lipsum}
\newenvironment{appendices}
{
    \cleardoublepage
    \clearpage\thispagestyle{empty}\addtocounter{page}{-1}
    \vspace*{\fill}
    \begin{center}
        {\bfseries\Huge\appendixname}
    \end{center}
    %\newpage
    \vspace*{\fill}
	\appendix
	%\renewcommand{\thechapter}{}
	
	\titlecontents{chapter}
  		[0pt]{}
  		{\bfseries\appendixname\ \thecontentslabel\quad}
  		{\bfseries\thecontentslabel}
  		{\bfseries\titlerule*[.25pc]{.}\contentspage}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
