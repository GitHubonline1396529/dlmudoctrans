# dlmudoctrans: 非官方大连海事大学本科生毕业文献翻译模板

## 关于本模板

由于我校本科生毕业要求中需要翻译一篇近年来的外文文献，而且以我所在的学院的要求，文献翻译的格式是和毕业论文一致的，而且提供了专用的封面。对于毕业论文，已经有了 [Johnson Lo00](https://github.com/JohnsonLo00) 开发的文档类 [dlmuthesis](https://github.com/JohnsonLo00/dlmuthesis)，然而对于文献翻译的格式，网上并没有现成的模板。于是我决定自己动手做一个。我自己用 \LaTeX 复刻了封面样式，然后迁移了 [`dlmuthesis.cls`](https://github.com/JohnsonLo00/dlmuthesis/blob/main/dlmuthesis.cls) 中指定正文格式的部分代码实现。

尽管本学期的文献翻译任务已经到了中期，大部分同学可能都已经自己调好了格式，在现在这个时间点上开源这个模板可能已经有些太迟了，但是至少可以供后续同学使用。

## Q&A

### Q: 为什么不直接使用 Word？

琢磨一下这个问题对吧，假设现在用户是一个我校本科生，毕业既要写论文，又要写文献翻译，但是文献翻译的格式要求又跟毕业论文是一样的，如果没有现成的 \LaTeX 模板，然后自己又不会自己做模板的话，相当于在 \LaTeX 里面写好了毕业论文之后，还得回到 Microsoft Word 去把人家调过的一遍格式设置自己再搞一遍，那用户要是知道这一点的话，大概一开始写论文的时候就用 Word 了。那你这不是折磨人吗？所以我觉得如果有一个现成的 \LaTeX 模板可以直接使用的话，还是挺好的。

### Q: 为什么不直接使用 [dlmuthesis](https://github.com/JohnsonLo00/dlmuthesis)？

于理而言，在 [dlmuthesis](https://github.com/JohnsonLo00/dlmuthesis) 里完成文献翻译的写作，注释掉用于生成论文样式封面的 `\makepage` 命令，然后再在 Word 里完成封面，最后再将 Word 生成的 PDF 和 LaTeX 生成的 PDF 合并成一个文件，应该是可以的。但是这样做有一个问题：麻烦。

实际上按照学院的要求，文献翻译的封面和毕业论文的封面只有一点不大的区别，就是删掉了学校的 Banner 和校徽，然后修改了标题字样等。只需要对原来的封面做一些小的修改就可以了。为了避免在 Word 和 LaTeX 之间来回切换，我决定直接在 LaTeX 里完成封面。

### Q：为什么不直接提供 `cover.sty` 而是提供一个完整的模板？

也许有些朋友会想到，直接提供一个封面样式 `cover.sty` 文件就可以了，大家只需要在自己的 [dlmuthesis](https://github.com/JohnsonLo00/dlmuthesis) 文档里启用本科毕业论文格式，再引用这个文件输出封面就可以了。实际上，我也考虑过这个问题。但是由于 [`dlmuthesis.cls`](https://github.com/JohnsonLo00/dlmuthesis/blob/main/dlmuthesis.cls) 的机制问题：在 [`dlmuthesis.cls`](https://github.com/JohnsonLo00/dlmuthesis/blob/main/dlmuthesis.cls) 里面，封面的样式 (本科样式、硕博样式、不同专业的样式等) 是通过文档类开头的参数选项进行选择的。这也就是说，如果你想要在 `dlmuthesis` 里使用这个封面，有两种选择：

1. 在 [`dlmuthesis.cls`](https://github.com/JohnsonLo00/dlmuthesis/blob/main/dlmuthesis.cls) 里面添加一个新的选项来选择这个封面。这样做的代价是：每次更新 `dlmuthesis` 的时候，你都需要手动修改 [`dlmuthesis.cls`](https://github.com/JohnsonLo00/dlmuthesis/blob/main/dlmuthesis.cls) 文件。
2. 定义一个与 `\makepage` 不同的命令来生成封面，在 `cover.sty` 里提供这个命令。但这样会导致很多的兼容性问题，具体的问题需要结合代码才能讲清楚，我这里就不赘述了。

还有一个问题是因为项目隔离的缘故，一般来说在做文献翻译的时候我们会创建一个新的文件夹，所有的文件都放在这个文件夹里。这样做的好处是可以避免和毕业论文的文件混淆。但是如果你把 `cover.sty` 放在这个文件夹里，在此基础之上再包含一整个完整的 [dlmuthesis](https://github.com/JohnsonLo00/dlmuthesis) 项目主目录，文件就太多太杂了，而且你还把很多实际上是一样的文件存了两份。

综上所示，为了避免这些问题，我决定直接提供一个完整的模板。

## 文档与使用方法

由于仓促上线，文档的手册还没有编写。但是我会在后续的版本中添加手册。现在你可以直接使用这个模板，或者参考 [dlmuthesis](https://github.com/JohnsonLo00/dlmuthesis) 项目的文档来使用。除此之外，我写了非常详细的代码注释 (真的非常详细，只不过是全英文的。但我觉得这对你来说应该不是什么大问题……应该吧？)，你可以直接阅读代码来了解如何使用这个模板。

本文档类相比于 [dlmuthesis](https://github.com/JohnsonLo00/dlmuthesis) 的主要区别在于：

1. 封面样式，前面说过了，此不赘述。
2. 正文格式：正文格式和 [dlmuthesis](https://github.com/JohnsonLo00/dlmuthesis) 的本科生毕业论文格式一致，主要是为了保持一致性。但是删除了硕博论文的格式选项。
3. 引用文献使用了 `biblatex`，而不是 `natbib`。一方面是为了精简代码，不仅代码实现本身更简单，而且我可以直接使用基于 `biblatex` 的 `biblatex-gb7714-2015` 宏包 (没错真的有一个宏包名字就叫 `biblatex-gb7714-2015` 可以直接使用，但是如果你用的是 MiK\TeX，那你大概得为了这个模板单独去装这个宏包了。)，这样我就不需要单独传一份 `.bst` 文件了。另一方面，在你做文献翻译的时候，引用的文献应该就是直接从论文网站上导出的原文献所有引文的 `.bib` 文件，并不需要导入很多个 `.bib` 文件，使用 `biblatex`，简简单单的执行一次 `\addbibresource` 就可以了。
4. 一定程度的模块化设计：我将部分代码的实现进行了模块化设计，方便后续的维护和扩展。比如说，封面的实现代码被放在了 `style/cover.sty` 文件里，正文格式的实现代码被放在了 `dlmudoctrans.cls` 文件里。

## 许可证

本项目使用 [LPPL 1.3c 许可证](https://www.latex-project.org/lppl/lppl-1-3c/)。你可以自由使用、修改和分发本项目的代码和文档，但请保留原作者的署名和版权声明。具体的许可证信息请参见 [LICENSE.txt](LICENSE.txt)  文件。
