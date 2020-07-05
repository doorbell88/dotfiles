command Subfile :-1read $HOME/.vim/latex/snippets/subfile.tex | norm 3jI

command Section :norm 0yg_O%<C-o>79a_<ESC>o<ESC>p,t<ESC>kr%VUjI\section{<ESC>A}<ESC>

command Subsection :norm O<C-o>40a-<ESC>0r%yypjyykPI% <ESC>VUjjI\subsection{<ESC>A}<ESC>
command Equation :-1read $HOME/.vim/latex/snippets/equation.tex | norm jA

command Item :norm I\begin{itemize}<CR>\end{itemize}<ESC>O\item<SPACE>
command Enum :norm I\begin{enumerate}<CR>\end{enumerate}<ESC>O\item<SPACE>
