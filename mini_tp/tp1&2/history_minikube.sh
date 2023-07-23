# ------------------------------------------------------------------------------------------------- 
#   ATTENTION : Pour installer minikube il vous faut une VM avec au moins 4 Go et 2 cpu minimum
# Le code que j’ai utilisé pour ma VM centos/7 (sur un autre OS il faudra vous référez à la documentation officielle)
# -------------------------------------------------------------------------------------------------
sudo -i
hostnamectl set-hostname minikube-master # configurer l'hote minikube-master
bash # executé la conf
useradd minikube # ajouter un utilisateur
passwd minikube # mot de passe
new password password21
visudo # ajout des privilèges à l'utilisateur minikube
su minikube # se connecter à l'utilisateur
cd
#  install docker
# --------------------
    2  sudo yum update -y
    3  sudo yum install -y yum-utils
    4  sudo yum-config-manager     --add-repo     https://download.docker.com/linux/centos/docker-ce.repo
    5  sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    6  docker ps
    7  sudo systemctl daemon-reload
    8  sudo systemctl enable docker
    9  sudo systemctl start docker
   10  sudo chmod 777 /var/run/docker.sock
   11  docker ps
    # ----------------------------------------------
    #     Minikube install
    # ----------------------------------------------
   12  sudo yum install conntrack -y
   13  sudo yum install wget -y
   14  sudo wget https://github.com/kubernetes/minikube/releases/download/v1.23.0/minikube-linux-amd64
   15  ls
   16  sudo mkdir -p /usr/local/bin/
   17  sudo install minikube-linux-amd64 /usr/local/bin/minikube
   # ---------------------------------------------------------
   #        kubectl install
   # ----------------------------------
   18  sudo curl -LO https://dl.k8s.io/release/v1.22.1/bin/linux/amd64/kubectl
   19  sudo chmod +x ./kubectl
   20  sudo cp  ./kubectl /usr/local/bin/kubectl
   21  cd /usr/local/bin/
   22  ls
   23  sudo cp kubectl minikube /usr/bin/
   24  cd
   25  minikube version
   26  minikube start # minikube start –driver=none –kubernetes-version v1.23.0
   # ---------------------------------------------------------
   #        Pour l’autocomplétion:
   # ----------------------------------
      echo ‘source <(kubectl completion bash)’ >> ${HOME}/.bashrc && source ${HOME}/.bashrc
   27  kubectl get nodes
   29  minikube status
   30  docker ps
   31  docker images
   32  kubectl get pod
   33  kubectl get service
   34  pwd
   35  ls
   36  kubectl get nodes
   37  mkdir tp1
   38  cd tp1/
   39  touch pod.yaml
   40  vim pod.yaml
   41  ls

   #force delete a StatefulSet pod// kubectl delete pods simple-webapp-color --grace-period=0 --force 