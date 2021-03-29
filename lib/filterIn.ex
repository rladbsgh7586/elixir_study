defmodule TipApps.FilterIn do
    require Logger

    def getFront(str,head) do
        case String.split(str, head, parts: 2) do
            [left] -> {left , ""}
            [left, right] -> {left, right}
        end
    end

    def getContent(str,tail) do
        case String.split(str, tail, parts: 2) do
            [content, remain] -> {content, ""}
            [remain] -> {"", remain}
        end
    end

    def filterIn("",_head,_tail) do
        ""
    end

    def filterIn(str,head,tail) do
        {left, right} = getFront(str,head)
        {content, remain} = getContent(right,tail)
        content <> filterIn(remain,head,tail)
    end

    def test do
        IO.puts filterIn("abc()"  , "(" , ")"     )
        IO.puts filterIn("()abc"  , "(" , ")"      )
        IO.puts filterIn("abc()abc()"  , "(" , ")" )
        IO.puts filterIn("abc()abc()abc"  , "(" , ")" )
        IO.puts filterIn("abc(abc)abc()abc"  , "(" , ")" )
        IO.puts filterIn("abc(abc"  , "(" , ")" )
    end

end
