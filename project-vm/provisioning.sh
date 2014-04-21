apt-get update

PROV=/vagrant
HOME=/home/vagrant

# [ Configure BASH ]

cat $PROV/.bashrc >> $HOME/.bashrc

# [ GIT ]
apt-get install -y git

date +%s | sha256sum | base64 | head -c 32 > $HOME/.ssh/passphrase
ssh-keygen -t rsa -C "hello@marcogalletti.com" -N `cat /home/vagrant/.ssh/passphrase` -f $HOME/.ssh/id_rsa
chown vagrant:vagrant $HOME/.ssh/id_rsa
chown vagrant:vagrant $HOME/.ssh/id_rsa.pub
#&& ssh-add ---> TODO:  http://goo.gl/tiFJUN

# [ VIM ]
apt-get install -y vim

# The Ultimate vimrc
git clone git://github.com/amix/vimrc.git /tmp/.vim_runtime
cat /tmp/.vim_runtime/vimrcs/basic.vim >> $home/.vimrc && chown vagrant:vagrant $home/.vimrc

# [ R ]
apt-get install -y r-base

# [ ... EXTRA ]

# Create a Sandbox
mkdir $HOME/sandbox && chown vagrant:vagrant $HOME/sandbox

# Configure course demo
#git clone -b coursera https://... $HOME/demo && chown vagrant:vagrant $HOME/demo

