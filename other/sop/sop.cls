\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sop}

\LoadClass[12pt, a4paper]{article}
\RequirePackage[a4paper, margin=0.9in]{geometry}
\RequirePackage[hidelinks, pdfusetitle]{hyperref}
\RequirePackage{xcolor, sectsty, setspace}

\definecolor{headingcolor}{HTML}{4d7ea8}
\definecolor{margincolor}{HTML}{2e4b64}

\newcommand\headingcolor{}
\newcommand\margincolor{}

\DeclareOption{color}{
    \renewcommand\headingcolor{\color{headingcolor}}
    \renewcommand\margincolor{\color{margincolor}}
    \sectionfont{\fontsize{14}{15}\selectfont \color{headingcolor}}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\renewcommand\author[2]{
    \gdef\@author{\href{#1}{#2}}
    \hypersetup{pdftitle={\@title},pdfauthor={#2}}
}
\newcommand\email[1]{\gdef\email{\href{mailto:#1}{#1}}}
\renewcommand{\maketitle}{
  \begin{center}
    {\headingcolor \Huge \scshape \@title}
    {\margincolor \rule{\linewidth}{0.5mm}}
    {\normalsize \headingcolor \@author \hfill \email}
  \end{center}
}

\setlength\parindent{0pt}
\onehalfspacing

