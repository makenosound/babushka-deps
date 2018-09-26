dep "packages" do
  requires "ack.managed"
  requires "awscli.managed"
  requires "bat.managed"
  requires "exa.managed"
  requires "httpie.managed"
  requires "jq.managed"
  requires "mas.managed"
  requires "ngrok"
  requires "overmind.managed"
  requires "pgcli.managed"
  requires "pygments.py"
  requires "s3cmd.managed"
  requires "wget.managed"
end

dep "ack.managed"
dep "awscli.managed" do
  installs "awscli"
  provides "aws"
end
dep "bat.managed"
dep "exa.managed"
dep "httpie.managed" do
  provides "http"
end
dep "jq.managed"
dep "mas.managed"

dep "ngrok" do
  met? {
    "/usr/local/bin/ngrok".p.exists?
  }

  meet {
    Babushka::Resource.extract("https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-darwin-amd64.zip") do |archive|
      "ngrok".p.copy "/usr/local/bin/ngrok"
    end
  }
end

dep "overmind.managed" do
  requires "tmux.managed"
end

dep "pgcli.managed"
dep "pygments.py"
dep "s3cmd.managed"
dep "tmux.managed"
dep "wget.managed"