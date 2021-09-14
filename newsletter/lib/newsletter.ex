defmodule Newsletter do
  def read_emails(path) do
    {:ok,data}=File.read(path)
    data |> String.split("\n") |> Enum.filter( fn (a) -> a !="" end )
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid,email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_one_email(email,send_fun,log) do
    ok=send_fun.(email)
    if ok==:ok do log_sent_email(log,email) end
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    emails=read_emails(emails_path)
    log=open_log(log_path)
    Enum.map( emails, fn (em) -> send_one_email(em,send_fun,log) end )
    close_log(log)
  end
end
