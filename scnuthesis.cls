% Author: Yang Liu
% Email: blueloveTH@foxmail.com
% License: LaTeX Project Public License v1.3c

\ProvidesClass{cucthesis}[2021/02/23 v0.1 Thesis Class of Communication University of China]
\NeedsTeXFormat{LaTeX2e}

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}

\SetupKeyvalOptions{family=CUC, prefix=CUC@, setkeys=\kvsetkeys}
\newcommand{\ckv}[1]{\kvsetkeys{CUC}{#1}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*\relax
\LoadClass{article}

% 设置纸张格式
\RequirePackage[a4paper,left=3cm,right=2.3cm,top=2.3cm,bottom=2.6cm,headheight=10cm,headsep=0.3cm]{geometry}
\setlength{\headsep}{0.6cm}

\RequirePackage{amsthm,amsmath,amssymb,indentfirst,booktabs,multicol,multirow,xcolor,graphicx,fancyhdr,hologo}

% 设置目录与引用的超链接（需要编译多次）
\RequirePackage{hyperref}
\hypersetup{
  pdfborder={0 0 0},
  colorlinks=false,linkcolor={blue},urlcolor={blue},filecolor={blue},citecolor={blue},
  linktoc=all,
}

%%%%%%%%%%%%%%%%%%%%%% 字体与段落 %%%%%%%%%%%%%%%%%%%%%%

\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage[UTF8,scheme=plain]{ctex}
\setmainfont{Times Newer Roman}

% 1.25倍行距
\linespread{1.25}

% 段落缩进2字符
\setlength\parindent{2\ccwd}

%%%%%%%%%%%%%%%%%%%%%% 引用格式 %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{gbt7714}
\bibliographystyle{gbt7714-numerical}
\setlength{\bibsep}{0.0pt}
\def\bibfont{\zihao{5}}
\renewcommand\refname{参考文献}

\renewcommand\figurename{图}
\renewcommand\tablename{表}

\RequirePackage{caption}
\DeclareCaptionLabelSeparator{onespace}{~~}
\captionsetup[table]{skip=8pt,labelsep=onespace}
\captionsetup[figure]{skip=8pt,labelsep=onespace}

\renewcommand{\captionfont}{\songti\zihao{5}}

% 图表与公式编号
\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{equation}{section}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}

\newcommand{\appendixformat}{
  \renewcommand\figurename{附图}
  \renewcommand\tablename{附表}
  \renewcommand{\thefigure}{\arabic{figure}}
  \renewcommand{\thetable}{\arabic{table}}
}

%%%%%%%%%%%%%%%%%%%%%% code style %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{listings}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}

\lstdefinestyle{defaultstyle}{
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breaklines=true,
    keepspaces=true,
    tabsize=2,
    % frame=single,
}

\lstset{style=defaultstyle}

%%%%%%%%%%%%%%%%%%%%%% 摘要与关键词 %%%%%%%%%%%%%%%%%%%%%%

% 中文摘要命令
\renewenvironment{abstract}{
  \clearpage\phantomsection
  \begin{center}
    \vspace*{-10pt}
    \zihao{3}\heiti{摘~~~~要}

    \vspace{8pt}
  \end{center}

  \addcontentsline{toc}{section}{摘~~~~要}
  \zihao{-4}\ignorespaces
}{\clearpage}

% \renewenvironment{disclaim}{
%   \clearpage\phantomsection
%   \begin{center}
%     \vspace*{-10pt}
%     \zihao{3}\heiti{学术诚信声明}
%
%     \vspace{8pt}
%   \end{center}
%
%   \addcontentsline{toc}{section}{学术诚信声明}
%   \zihao{-4}\ignorespaces
% }{\clearpage}

\newcommand{\keywords}[1]{\newline\newline\newline\noindent\heiti{关键词：}\heiti #1}

% 英文摘要命令
\newenvironment{abstractEN}{
  \clearpage\phantomsection
  \begin{center}
    \vspace*{-10pt}
    \zihao{3}\textbf{\heiti{ABSTRACT}}
    
    \vspace{8pt}
  \end{center}

  \addcontentsline{toc}{section}{ABSTRACT}
  \zihao{4}\ignorespaces
}{\clearpage}

\newcommand{\keywordsEN}[1]{\newline\newline\newline\noindent{Keywords: }#1}

%%%%%%%%%%%%%%%%%%%%%% 章节标题样式 %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{setspace,titlesec,zhnumber,titletoc}

\renewcommand{\thesection}{\zhnum{section}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}

\newcommand{\sectionbreak}{\clearpage}
\titleformat{\section}[block]{\vspace*{-10pt} \centering \zihao{3} \heiti}
{第 \thesection~章~~}{0pt}{\vspace{8pt}}

\titleformat{\subsection}{\zihao{4} \heiti}
{\thesubsection.~~}{0pt}{}

\titleformat{\subsubsection}{\zihao{-4} \heiti}
{\thesubsubsection.~~}{0pt}{}

%%%%%%%%%%%%%%%%%%%%%% 目录样式 %%%%%%%%%%%%%%%%%%%%%%

\renewcommand\contentsname{\heiti \centering \zihao{3} 目~~~~录}

\titlecontents{section}[0pt]{\bfseries \songti \zihao{-4}}
{第~\thecontentslabel~章~~}{}
{\titlerule*[0.7em]{.}\contentspage}

\titlecontents{subsection}[1\ccwd]{\songti \zihao{-4}}
{\thecontentslabel~~}{}
{\titlerule*[0.7em]{.}\contentspage}

\titlecontents{subsubsection}[3\ccwd]{\songti \zihao{-4}}
{\thecontentslabel~~}{}
{\titlerule*[0.7em]{.}\contentspage}


%%%%%%%%%%%%%%%%%%%%%% 命令封装 %%%%%%%%%%%%%%%%%%%%%%

\newenvironment{references}{\clearpage\phantomsection\addcontentsline{toc}{section}{参考文献}}{\clearpage}


\fancypagestyle{CUCThesisMain}{
    \fancyhf{}
    \cfoot{\songti\zihao{-5}{\thepage}}
    \renewcommand{\headrulewidth}{0pt}
}


\newcommand{\contentpage}{
  \begin{spacing}{1.5}
    \tableofcontents
  \end{spacing}

  \clearpage

  \chead{\zihao{5}\ziju{0.08}\fangsong{\hide{华南师范大学本科毕业论文}}}
  \renewcommand{\headrulewidth}{1.0pt}
  \pagenumbering{arabic}
  \setcounter{page}{1}
}

\newcommand{\nonumsection}[1]{
  \clearpage\phantomsection
  \section*{#1}
  \stepcounter{section}
  \addcontentsline{toc}{section}{#1}
}



%%%%%%%%%%%%%%%%%%%%%% 封面 %%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{datetime}

\newcommand{\dunderline}[3][-6pt]{{
  \setbox0=\hbox{#3}
  \ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}
}}

\newcommand{\infobox}[2]{
    \hspace{1cm}\songti\zihao{-2}\textbf{\selectfont{#1~\dunderline{1pt}{\makebox[10cm][c]{#2}}}}
}


\newcommand{\coverpage}{
  \begin{titlepage}
    \vspace*{-10pt}
  
    \vspace*{2\ccwd}
  
    \centering
    \includegraphics[width=\textwidth]{./imgs/south_china_normal_university_icon.jpg}
    \centering
    % \zihao{-0}\textbf{\songti{毕\hphantom{空}业\hphantom{空}论\hphantom{空}文}}
    \zihao{-1}\textbf{本科毕业论文（设计）}
    \vspace{0.6cm}
  
    % \zihao{-2}\textbf{\heiti\thesisTitle}
    \vspace{2.5cm}
  
    \flushleft
  
    \begin{spacing}{1.5}
        \infobox{论文题目}{\thesisTitle}

        \infobox{指导教师}{\yourMentor}

        \infobox{学生姓名}{\yourName}

        \infobox{学\hphantom{空白}号}{\studentID}

        \infobox{学\hphantom{空白}院}{\yourDept}
  
        \infobox{专\hphantom{空白}业}{\yourMajor}

        %\infobox{毕业时间}{\THEYEAR 年 7 月}
    	\infobox{毕业时间}{ 2024 年 7 月}
    \end{spacing}
  
    \vspace{4cm}

    \centering
    \zihao{-2}\ziju{0.5}\textbf{\songti{\hide{华南师范大学}}}
  
    \zihao{-2}\ziju{0.5}\textbf{\songti{\zhtoday}}
  \end{titlepage}
  
  \pagestyle{CUCThesisMain}
  \pagenumbering{Roman}
  \setcounter{page}{1}
}

%%%%%%%%%%%%%%%%%%%%%% 送审支持 %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{pgffor} % 加载pgffor包
\RequirePackage{xstring} % 加载pgffor包
\newif\ifhideflag
\hideflagtrue % 设置为 true 将文本替换为 *
% \hideflagfalse % 设置为 true 将文本替换为 *

% 定义一个新的命令，根据 \hideflag 的取值来决定是否隐藏文本
% \newcommand{\hide}[1]{\ifhideflag \hidechars{#1} \else #1 \fi}

\newcommand{\hide}[1]{%
    \ifhideflag%
      \StrLen{#1}[\StringLength]%
      \foreach \x in {1,...,\StringLength}{*}%
    \else%
        #1%
    \fi%
}
% \newcommand{\hidechars}[1]{%
%     \StrLen{#1}[\stringlength]
%     \StrSubstitute[0]{#1}{\StrLeft{#1}{\stringlength}}{*******************}
% }
% \newcommand{\hide}[2]{%
%     \ifhideflag
%         \newcount\hidenum
%         \hidenum = #2
%         \loop
%             *\advance\hidenum by -1
%         \ifnum \hidenum>0
%         \repeat
%     \else
%         #1
%     \fi
% }


%%%%%%%%%%%%%%%%%%%%%% JavaScript语法高亮支持 %%%%%%%%%%%%%%%%%%%%%%

\usepackage{color}
\definecolor{lightgray}{rgb}{.9,.9,.9}
\definecolor{darkgray}{rgb}{.4,.4,.4}
\definecolor{purple}{rgb}{0.65, 0.12, 0.82}

\lstdefinelanguage{JavaScript}{
  keywords={typeof, new, true, false, catch, function, return, null, catch, switch, var, if, in, while, do, else, case, break, const},
  keywordstyle=\color{blue}\bfseries,
  ndkeywords={class, export, boolean, throw, implements, import, this, async},
  ndkeywordstyle=\color{darkgray}\bfseries,
  identifierstyle=\color{black},
  sensitive=false,
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  commentstyle=\color{purple}\ttfamily,
  stringstyle=\color{red}\ttfamily,
  morestring=[b]',
  morestring=[b]"
}

% Ref on: https://github.com/plow-technologies/onping-templates/blob/93e136a4522b64e4e6942414eeabf79d095f3555/lumberjack-automate/docs/lstynix.tex#L7
\definecolor{identifiercolor}{rgb}{0.36, 0.54, 0.66}
\definecolor{keywordcolor}{rgb}{0.93,0.79,0.69}
\definecolor{commentcolor}{rgb}{0.66,0.66,0.66}
\definecolor{stringcolor}{rgb}{0.75, 0.5, 0.51}
\lstdefinelanguage{nix}{
  % Anything betweeen $ becomes LaTeX math mode
  mathescape=false,
  % Comments may or not include Latex commands
  texcl=false,
  keywords=[1]{inherit,import,if,then,else,false,true,or,rec,let,in,assert,with},
  % Comments delimiters, we do turn this off for the manual
  comment=[l]{\#},
  morecomment=[s]{/*}{*/},
  % Spaces are not displayed as a special character
  showstringspaces=false,
  % String delimiters
  morestring=[b]",
  morestring=[d]'',
  % Size of tabulations
  tabsize=2,
  % Enables ASCII chars 128 to 255
  extendedchars=false,
  % Case sensitivity
  sensitive=true,
  % Automatic breaking of long lines
  breaklines=false,
  % Default style for listings
  % basicstyle=\small\ttfamily,
  basicstyle=\footnotesize\ttfamily,
  % Position of captions is bottom
  captionpos=b,
  % flexible columns
  columns=[l]fixed,
  % Style for (listings') identifiers
  identifierstyle={\ttfamily\color{identifiercolor}},
  % Style for declaration keywords
  keywordstyle={\bfseries},
  % Style for strings
  stringstyle={\ttfamily\color{stringcolor}},
  % Style for comments
  commentstyle={\ttfamily\color{commentcolor}},
}[keywords,comments,strings]

\definecolor{mGreen}{rgb}{0,0.6,0}
\definecolor{mGray}{rgb}{0.5,0.5,0.5}
\definecolor{mPurple}{rgb}{0.58,0,0.82}
\definecolor{backgroundColour}{rgb}{0.95,0.95,0.92}

\lstdefinestyle{CStyle}{
    % backgroundcolor=\color{backgroundColour},   
    commentstyle=\color{mGreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{mGray},
    stringstyle=\color{mPurple},
    basicstyle=\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2,
    language=C
}

% \lstdefinelanguage{Rust}{
%     morekeywords={abstract,alignof,as,async,await,box,do,const,continue,false,final,fn,for,if,impl,in,let,loop,macro,match,mod,move,mut,offsetof,override,priv,pub,ref,return,self,Self,static,struct,super,trait,true,type,typeof,unsafe,unsized,use,extern,yield},
%     sensitive=true,
%     morecomment=[l]{//},
%     morecomment=[s]{/*}{*/},
%     morestring=[b]",
%     morestring=[b]',
%     morestring=[s]{r#"}{"#},
% }

\lstdefinelanguage{Rust}{
  % Anything betweeen $ becomes LaTeX math mode
  mathescape=false,
  % Comments may or not include Latex commands
  texcl=false,
  keywords=[1]{inherit,import,if,then,else,false,true,or,rec,let,in,assert,with},
  % Comments delimiters, we do turn this off for the manual
  comment=[l]{\#},
  morecomment=[s]{/*}{*/},
  % Spaces are not displayed as a special character
  showstringspaces=false,
  % String delimiters
  morestring=[b]",
  morestring=[d]'',
  % Size of tabulations
  tabsize=2,
  % Enables ASCII chars 128 to 255
  extendedchars=false,
  % Case sensitivity
  sensitive=true,
  % Automatic breaking of long lines
  breaklines=false,
  % Default style for listings
  % basicstyle=\small\ttfamily,
  basicstyle=\footnotesize\ttfamily,
  % Position of captions is bottom
  captionpos=b,
  % flexible columns
  columns=[l]fixed,
  % Style for (listings') identifiers
  identifierstyle={\ttfamily\color{identifiercolor}},
  % Style for declaration keywords
  keywordstyle={\bfseries},
  % Style for strings
  stringstyle={\ttfamily\color{stringcolor}},
  % Style for comments
  commentstyle={\ttfamily\color{commentcolor}},
  numbers=left,
  % frame=single,
  keywordstyle=\color{blue},
  commentstyle=\color{green},
}[keywords,comments,strings]

\lstdefinelanguage{Pseudocode}{
  % Anything betweeen $ becomes LaTeX math mode
  mathescape=false,
  % Comments may or not include Latex commands
  texcl=false,
  keywords=[1]{function,loop,if,else,return,while},
  % Comments delimiters, we do turn this off for the manual
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  % Spaces are not displayed as a special character
  showstringspaces=false,
  % String delimiters
  morestring=[b]",
  morestring=[d]'',
  % Size of tabulations
  tabsize=2,
  % Enables ASCII chars 128 to 255
  extendedchars=false,
  % Case sensitivity
  sensitive=true,
  % Automatic breaking of long lines
  breaklines=false,
  % Default style for listings
  % basicstyle=\small\ttfamily,
  basicstyle=\footnotesize\ttfamily,
  % Position of captions is bottom
  captionpos=b,
  % flexible columns
  columns=[l]fixed,
  % Style for (listings') identifiers
  identifierstyle={\ttfamily\color{black}},
  % Style for declaration keywords
  keywordstyle={\bfseries\color{blue}},
  % Style for strings
  stringstyle={\ttfamily\color{orange}},
  % Style for comments
  commentstyle={\ttfamily\color{green}},
  numbers=left,
  % frame=single,
}[keywords,comments,strings]

% algpseudocode 
\usepackage{algpseudocodex}
\usepackage{algorithm}
