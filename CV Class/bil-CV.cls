%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% \begin{Simple LaTeX CV Template Class} %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Authors & Credits:                                                 %%
%%                                                                    %%
%% After years of using this CV I have lost where I sourced it from,  %%
%% which I feel awful about.  It was created as a document with       %%
%% ‘editable fields’ and not as a class.  All I have done is made it  %%
%% into a class for convenience, though a number of my own            %%
%% customisations have been entwined with the original over the       %%
%% years.                                                             %%
%%     -Ben Lavery, hashbang0.com / https://github.com/forquare       %%
%%                                                                    %%
%% With help from:                                                    %%
%%      www.sharelatex.com/blog/2011/03/27/how-to-write-a-latex-      %%
%%         class-file-and-design-your-own-cv.html                     %%
%%                                                                    %%
%%      www.sharelatex.com/blog/2013/06/28/how-to-write-a-latex-      %%
%%         class-file-and-design-your-own-cv.html                     %%
%%                                                                    %%
%%      www.tug.org/TUGboat/tb28-1/tb88flynn.pdf                      %%
%%                                                                    %%
%%      tex.stackexchange.com/questions/81686/pass-xkeyval-option-    %%
%%         to-class                                                   %%
%%                                                                    %%
%%      tex.stackexchange.com/questions/235094/unwanted-and-          %%
%%         unwarranted-indent-after-section                           %%
%%                                                                    %%
%%      www.latex-project.org/guides/clsguide.pdf                     %%
%%                                                                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Optionals %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{article}}%
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{article}}%
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{article}}%
%
\ProcessOptions%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Class Particulars %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Loads a “base class” which we can modify.
\LoadClass{article}%
\ProcessOptions%

% Class requirements and description
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{bil-CV}[2015/03/22 Ben Lavery’s CV Class]%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Required Packages %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This is a helpful package that puts math inside length specifications
% http://www.ctan.org/pkg/calc
\RequirePackage{calc}%

% Good for playing with paper sizes
% http://www.ctan.org/pkg/geometry
\RequirePackage{geometry}%

% For hyperlinks in text
% http://www.ctan.org/pkg/hyperref
\RequirePackage{hyperref}%

% To remove headers and footers
% http://www.ctan.org/pkg/fancyhdr
\usepackage{fancyhdr}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Lengths %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Half of the page width, useful for ‘false columns’
\newlength{\halfpage}%
\setlength{\halfpage}{(\textwidth+\marginparwidth+\marginparsep)/2}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Layout %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Puts the section titles on left side of page
% Section titles are in the margin
\reversemarginpar%

% Set up the margins/etc
\geometry{%
	paper=a4paper,        % Use A4 paper
	marginparwidth=20mm,  % Length of section titles (marginal note width)
	marginparsep=4mm,     % Separation between the marginal note and main text
	margin=12mm,          % margins (all)
	rmargin=16mm,%
	includemp,            % Include marginal note in textwidth calculations
}

% Stop indenting throughout entire document
\setlength{\parindent}{0mm}%

% Stop hyphens
\hyphenpenalty=10000%
\exhyphenpenalty=10000%

% Remove header and footers
\pagestyle{fancy}%
\fancyhead{}%
\fancyfoot{}%
\renewcommand{\headrulewidth}{0pt}%
\renewcommand{\footrulewidth}{0pt}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% New Commands & Environments %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The title (name) with a horizontal rule under it
% Usage: \makeheading{name}
% Place at top of document. It should be the first thing.
\newcommand{\makeheading}[1]{%
	\hspace*{-\marginparsep minus \marginparwidth}%
	\begin{minipage}[t]{\textwidth+\marginparwidth+\marginparsep}%
		{\large \bfseries #1}\\%
		[-0.15\baselineskip]%
		\rule{\columnwidth}{1pt}%
	\end{minipage}
}%

% To add some paragraph space between lines.
% This also tells LaTeX to preferably break a page on one of these gaps
% if there is a needed pagebreak nearby.
\newcommand{\littleblankline}{%
	\vspace{1.5mm}%
	\\%
	\pagebreak[2]%
}%

% Adds a short line between ‘subsections’
\newcommand{\subsectionrule}{%
	\rule{300px}{0.5px}%
	\vspace{1mm}%
	 %
}%

% Adds thinspace around an en-dash for dates containing months
\newcommand{\daterange}[2]{%
	#1\thinspace--\thinspace#2%
}%

% Add contact information in a ‘nice’ way
\newcommand{\contactdetails}[8]{%
	\begin{minipage}[t]{\halfpage}%
		#4\\%
		#5\\%
		#6\\%
		#7\\%
		#8%
	\end{minipage}%
	\begin{minipage}[t]{\halfpage}%
		\textit{Phone}: #1\\%
		\textit{E-mail}: \href{#2}{#2}\\%
		\textit{WWW}: \href{#3}{#3}%
	\end{minipage}%
}%

% Add the ‘head’ section for education/work places
\newcommand{\placementheader}[4]{%
		\textbf{#1}, {\daterange{#2}{#3}}\\%
		#4%
}%

% Add the ‘head’ section for education/work places
\newcommand{\placementheaderonedate}[3]{%
		\textbf{#1}, {#2}\\%
		#3%
}%

% Use a normal itemised list, but compact the space between bullets to
% ‘normal’ line spacing.
\newenvironment{compactlist}{%
	\vspace{-2mm}%
	\begin{itemize}%
		\setlength{\itemsep}{0pt}%
		\setlength{\parskip}{0pt}%
		\setlength{\parsep}{0pt}%
}{%
	\end{itemize}%
	\pagebreak[2]%
	\vspace{-\baselineskip}%
}%

% Use a normal itemised list, but compact the space between bullets to
% ‘normal’ line spacing.  Use this INSIDE other compact lists.
\newenvironment{innercompactlist}{%
	\vspace{-1mm}%
	\begin{itemize}%
		\setlength{\itemsep}{0pt}%
		\setlength{\parskip}{0pt}%
		\setlength{\parsep}{0pt}%
}{ %
	\end{itemize}%
	\pagebreak[2]%
	\vspace{-1mm}%
}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% Renew Commands & Environments %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Otherwise the top of the section header will not line up with the top
% of the section.
\renewcommand{\section}[2]{%
	\pagebreak[2]%
	\vspace{\baselineskip}%
	\phantomsection%
	\addcontentsline{toc}{section}{#1}%
	\hspace{0mm}%
	\marginpar{%
		\raggedright%
		\scshape #1%
	}#2%
}%

\renewcommand{\subsection}[1]{%
	\textbf{#1}%
}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% \end{Simple LaTeX CV Template Class} %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%