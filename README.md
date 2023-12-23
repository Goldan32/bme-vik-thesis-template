# Thesis Template for Linux Users

Taken from the official BME VIK thesis template: http://diplomaterv.vik.bme.hu/hu/

## Usage

- Read the official guide
  - Use command `make guide` to generate it
  - Find output at `pdf/guide.pdf`
- Select language using `make switch_to_english` or `make switch_to_hungarian`, english is the default
- Fill out the author and other such details in `thesis.tex`
- Create your source files in `content/` and include them at `thesis.tex:79`
- Use `bib/user.bib` as your bibliography
- Place your pictures in the `figures/` directory
- Issue command `make` to build your thesis
- Output will be `pdf/thesis.pdf`

## List of additions to original repository

- Make repository lighter by removing some features that are not essential
- Create a `.gitignore` file
- Add a `make clean` command
- Using `make` builds the actual thesis instead of the usage guide
- Usage guide can be generated using the `make guide` command

## Other general tips

### Label code segments

This makes it possible to refer to code listings in the document. Define your code blocks.

```latex
\begin{lstlisting}[language=C,frame=single,float=!ht,label={lst:hello-world},caption={Title of Listing}]
#include <stdio.h>

int main() {
  printf("Hello World!\n");
  return 0;
}
\end{lstlisting}
```

Refer to them in text.

```latex
Listing~\ref{lst:hello-world} demontrates how to write a C program.
```

### Make figures stay exactly where you put them in text

Following the official guide, all pictures will be placed near where they were included, but at the "best" place. This can be overridden by using `[H]` instead of `[!ht]`.

```latex
\begin{figure}[H]
    \centering
    \includegraphics[width=150mm, keepaspectratio]{figures/figure-name.png}
    \caption{Title of Figure}
    \label{fig:example-figure}
\end{figure}
```

### Syntax highlighting in code blocks

TBA
