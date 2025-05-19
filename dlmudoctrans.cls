%
% This is file "dlmudoctrans.cls"
%
% Copyright (C) 2023-2024 by Githubonline1396529 <yyg249942899@163.com>
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dlmudoctrans}[
2025-04-20 Unofficial LaTeX Document Translation Template for Dalian
Maritime University. Version 0.0.1.4-beta.
]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class options. 
%
% The following options are used to select the platform. Mainly related to the 
% search of fonts. The default is `windows'. If you are using a Mac or Ubuntu,
% please uncomment the corresponding line. The `web' option is used for online
% platforms such as Overleaf. The `customization' option is used to customize 
% the font with user-definations.
\newif\if@dlmudoctrans@windows
\newif\if@dlmudoctrans@macos
\newif\if@dlmudoctrans@ubuntu
\newif\if@dlmudoctrans@web % For online platforms such as Overleaf.
\newif\if@dlmudoctrans@customization

\newcounter{OptionOfPlatform} % Countor to recoerd the number of options.
\setcounter{OptionOfPlatform}{0}
\DeclareOption{windows}{
  \@dlmudoctrans@windowstrue
  \addtocounter{OptionOfPlatform}{1}
}
\DeclareOption{macos}{
  \@dlmudoctrans@macostrue
  \addtocounter{OptionOfPlatform}{1}
}
\DeclareOption{ubuntu}{
  \@dlmudoctrans@ubuntutrue
  \addtocounter{OptionOfPlatform}{1}
}
\DeclareOption{web}{
  \@dlmudoctrans@webtrue
  \addtocounter{OptionOfPlatform}{1}
}
\DeclareOption{customization}{
  \@dlmudoctrans@customizationtrue
  \addtocounter{OptionOfPlatform}{1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Passing options to the `article' class. The default one is `a4paper'.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Option constraint. Forcing users to choose only one platform-type.
\RequirePackage{ifthen}

\ifthenelse{\value{OptionOfPlatform}=0}{
  \ClassWarning{dlmudoctrans}{
    No platform-types in command '\protect\documentclass\space'. 
    Choose and complete one platform-type in command 
    '\protect\documentclass\space'. Defaulting to `windows'.
  }
  \@dlmudoctrans@windowstrue
}{}
\ifthenelse{\value{OptionOfPlatform}>1}{
  \ClassError{dlmudoctrans}{
    Too many platform-types in command '\protect\documentclass\space'. 
    Remain only one platform-type in command '\protect\documentclass\space'.
  }
}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compiler constraint. Forcing users to use xelatex and print necessary error
% messages.
\RequirePackage{iftex}
\ifxetex\else
\ClassError{dlmudoctrans}{
You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CTeX package setup. Note that some of the following codes are migrated from 
% the `dlmudoctrans.' project. The original author is JohnsonLo00. You can
% visit the project at <https://github.com/JohnsonLo00/dlmudoctrans>.
\RequirePackage[UTF8, heading=true, zihao = -4]{ctex}
\RequirePackage{totcount} % For counting the number of pages.

\ctexset{
  contentsname = \hfill{\zihao{3}目\hspace{2em}录}\hfill,
  bibname = \hfill{\zihao{3}\centerline{\ValOfBibname}}\hfill,
  section = {
    format = {\zihao{3}\bfseries},
    name = {第,章},
    aftername={~},
    beforeskip={20.0bp},
    afterskip={\dimexpr 10.0bp+\baselineskip-\f@size bp\relax},
  },
  subsection = {
    format={\zihao{4}\bfseries},
    aftername={~},
    beforeskip={\dimexpr 0.5ex+\baselineskip-\f@size bp\relax},
    afterskip={\dimexpr 0.5ex+\baselineskip-\f@size bp\relax},
  },
  subsubsection = {
    format={\zihao{-4}\bfseries},
    aftername={~},
	  beforeskip={\dimexpr 0.5ex+\baselineskip-\f@size bp\relax},
    afterskip={\dimexpr 0.5ex+\baselineskip-\f@size bp\relax},
  },
  paragraph = {
    format = {\zihao{-4}\bfseries},
    aftername={~},
    beforeskip={0.5ex plus 1ex minus 0.2ex},
    afterskip={0.5ex plus 1ex minus 0.2ex},
  }
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Document metadata settings. The following implementations are used to set the
% document metadat (titles, translator, etc.) in the preamble. The user can 
% use them.
%
% Note that `translator' is used to display the name of the "author of the 
% translation document", or "the author displayed on the cover page", which 
% means, the translator, which also means, the student's name. So that I can
% leave the original `\author' command unchanged to display the real author of
% the original document (book or article).
\RequirePackage{etoolbox}
\RequirePackage{authblk} % For the author and affiliation.

% Variables for the title page (Metadata).
\newcommand{\dlmudoctrans@tokens@cntitle}{~} % Chinese title.
\newcommand{\dlmudoctrans@tokens@entitle}{~} % English title.
\newcommand{\dlmudoctrans@tokens@translator}{~} % Name of the author.
\newcommand{\dlmudoctrans@tokens@sdtID}{~} % Student ID.
\newcommand{\dlmudoctrans@tokens@major}{~} % Major in Chinese.

\RequirePackage{style/titlefmt} % The title format setup.
\RequirePackage{style/thecover} % The title page style.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page layout setups.
\RequirePackage[twoside]{fancyhdr} % Page header and footer.
\renewcommand{\sectionmark}[1]{\markboth{#1}{}} % Related to the print mode.
\RequirePackage{geometry} % Customize the page.
\geometry{
  bindingoffset=5mm,
  top=2.5cm,
  bottom=2.5cm,
  left=3.0cm,
  right=2.5cm,
  headsep=0.5cm
}

% While `heading=true', the default left and right page headers are the current
% first and second level title names, so they should be set to empty. 
% Otherwise, the page header will be the current first and second level title 
% names.
\lhead{}
\rhead{}

% Adjust the header and footer line width.
\renewcommand{\headrulewidth}{0.4bp}
\renewcommand{\footrulewidth}{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Document font setup.

\RequirePackage{style/fonts} % Font setup.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table of contents setup.
\RequirePackage{titletoc}

% It seems that only the `section' level should be especially adjusted.
\titlecontents{section}
[0pt]
{\addvspace{2bp}\filright}
{\contentspush{\thecontentslabel}~~}
{}
{\titlerule*[8bp]{.}\contentspage}

\newcommand{\maketocpages}{
  \tableofcontents\thispagestyle{plain}
  \clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstract format setup.
\RequirePackage{abstract}

% Cancel the left and right indent of the abstract.
\setlength{\absleftindent}{0pt}
\setlength{\absrightindent}{0pt}

% Use normal font for the abstract title.
\renewcommand{\abstracttextfont}{\normalsize}
\renewcommand{\abstractnamefont}{\normalfont}

% Command for the abstract key words. Note that this is a document class for 
% document translation. So the user only needs a command for key words in
% Chinese.
\newcommand{\keywords}[1]{
  \vspace{\baselineskip}{}\noindent\bfseries 关键词：#1
}

% Format setting for the abstract page.
\AtBeginEnvironment{abstract}{
  \renewcommand\abstractname{\zihao{3}\bfseries 摘\hspace{2em}要}
  % \pagestyle{plain}
  % \cfoot{\zihao{-5} \thepage}
  % \pagenumbering{Roman}
}

% For jounral articles with short abstract we usually do not clear page after
% the abstract.
%
% \AtEndEnvironment{abstract}{
%   \clearpage
%   % \pagestyle{fancy} % 
% }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Math fomulas and theorem environment.

\RequirePackage{style/mathfmt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Package for algorithms.

\RequirePackage[ruled, lined]{algorithm2e}
\renewcommand{\algorithmcfname}{算法}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Numbered and unnumbered list settings.
\RequirePackage{enumitem} % For setting list format.
\setlist[enumerate,itemize,description]{
  align=left,
  leftmargin=0pt,
  itemindent=\parindent,
  labelsep=0pt,
  itemsep=0pt,
  parsep=0pt,
  topsep=0.2ex
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure and table settings.
\RequirePackage{caption}
\RequirePackage[labelformat=brace]{subcaption}
% `bicaption' is used to set the double space between the figure and table.
% Not necessary now.
% \RequirePackage[list=off]{bicaption}
\DeclareCaptionLabelSeparator{doublespace}{~~}
\DeclareCaptionFont{NORMALSIZEandHEITI}{\normalsize\heiti}

% The caption styling.
\captionsetup{font=small, labelsep=doublespace, labelfont=bf, textfont=bf}

% Number figures and tables in the section level.
\RequirePackage{amsmath} % Note `\numberwithin' requires the `amsmath' package.
\numberwithin{figure}{section}
\numberwithin{table}{section}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Packages for tables and figures.

% Used for setting table formats.
\RequirePackage{makecell}
\RequirePackage{booktabs} % Triple line table.
\RequirePackage{longtable} % Long table crossing pages.
\RequirePackage{tabularx} % Customize the table line width.
\RequirePackage{multirow} % Multi-row and multi-column table.
\RequirePackage{diagbox} % Diagonal line in the table.
\RequirePackage{bigstrut} % Add space in the table.
\RequirePackage{multicol} % Multi-column table.
\RequirePackage{threeparttable} % Add notes to the table.

% Used for inserting graphics.
\RequirePackage{graphicx}
\graphicspath{
  {./fig/}
  {./figs/}
  {./figure/}
  {./figures/}
  {./img/}
  {./imgs/}
  {./image/}
  {./images/}
  {./graphics/}
  {./graphic/}
  {./pictures/}
  {./picture/}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reference format settings based on `biblatex'.
\RequirePackage[
    style=gb7714-2015, % This is from a package named `biblatex-gb7714-2015'.
    sorting=none, 
    backend=biber,
    hyperref=true,
    url=false
    ]{biblatex} % Use `biber' as the backend.

% \setlength{\bibsep}{0bp}
% Note that it seems no \bibsep in `biblatex' package. So the above code is 
% useless. I should find another way to set the space between the bibliography.
\setlength{\bibitemsep}{0bp} % Set the space between the bibliography items.
\renewcommand{\bibfont}{\zihao{5}} % Fontsize for bibliography.

% Format settings before and after the bibliography. Note that this part of
% code is designed for natbib, migrated to here, and seems not working while
% using `biblatex'. That's why I commented it out. However, I don't really
% sure what exactly caused this. To figure it out, I need to do some tests. So
% I will leave it unremoved.
%
% \AddToHook{env/thebibliography/before}[add_to_toc]{
%   \RemoveFromHook{cmd/section/before}[keep_preskip_of_sectitle]
%   \phantomsection
%   \addcontentsline{toc}{section}{参考文献}
%   \vspace*{0pt}
% }

% The bibliography format setup.
\newcommand{\ValOfBibname}{参~ 考~ 文~ 献}

% The following code is used to set a bibliography title in the table of 
% contents which is fifferent from the one displayed at the begining of the Bib
% list. The Bib title at the begining of the Bib list is a centered text with a
% larger font size, while the one in the table of contents is a normal text. 
%
% At the end of the document the user should use:
%  \printbibliography[heading=dlmustyled]
%
% The `\ValOfBibname' command is used to set the title of the bibliography in
% the table of contents. The `\addcontentsline' command is used to add the
% bibliography title to the table of contents.
% 
\defbibheading{dlmustyled}{%
  \section*{\hfill{\zihao{3}\centerline{\ValOfBibname}}\hfill}
  \addcontentsline{toc}{section}{参考文献}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The hyperref package is used to add hyperlinks to the document.
\RequirePackage[
  hidelinks,
  bookmarksnumbered=true,
  breaklinks=true,
  bookmarksopen=true
]{hyperref}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy} % 
\fancyhead[C]{\zihao{-5}\dlmudoctrans@tokens@cntitle}
\pagenumbering{arabic}
