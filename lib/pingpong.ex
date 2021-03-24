defmodule Pingpong do

    def mailbox() do
      receive do
        {:ping} ->
          IO.puts " Ping !!"
          mailbox()
        {:pong} ->
          IO.puts " Pong !!"
      end
    end  
end



# pid = spawn(Pingpong, :mailbox, [])
# send pid, {:ping}
# send pid, {:pong}