---
title: kubectl
category: cli
docs_url: https://kubernetes.io/docs/reference/kubectl/
created: "2026-05-10"
tags: [kubernetes, k8s, devops, cli, containers]
---

# kubectl Cheatsheet

> Kubernetes command-line tool for deploying, managing, and debugging containerized applications on K8s clusters.

**Official Docs:** https://kubernetes.io/docs/reference/kubectl/  
**Cheat Sheet:** https://kubernetes.io/docs/reference/kubectl/cheatsheet/  
**Version:** v1.31+ (stable)

---

## Installation

### macOS
```bash
brew install kubectl
# or
brew install kubernetes-cli
```

### Linux
```bash
# Download latest stable
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Or via package manager
sudo apt install kubectl  # Debian/Ubuntu
sudo dnf install kubectl  # Fedora
sudo pacman -S kubectl    # Arch
```

### Windows
```powershell
choco install kubernetes-cli
# or
scoop install kubectl
```

### Verify
```bash
kubectl version --client
```

---

## Setup

### kubeconfig
**Default location:** `~/.kube/config`

```bash
# View current config
kubectl config view

# Set context
kubectl config use-context <context-name>

# Set namespace for context
kubectl config set-context --current --namespace=<namespace>
```

### Autocompletion
```bash
# Bash
source <(kubectl completion bash)
echo 'source <(kubectl completion bash)' >> ~/.bashrc

# Zsh
source <(kubectl completion zsh)
echo 'source <(kubectl completion zsh)' >> ~/.zshrc
```

---

## Command Reference

### Cluster Info
```bash
kubectl cluster-info                    # Cluster endpoints
kubectl cluster-info dump               # Dump cluster state
kubectl get nodes -o wide               # Node details
kubectl top node                        # Node resource usage
kubectl version                         # Client/server versions
```

### Namespaces
```bash
kubectl get namespaces                  # List namespaces
kubectl create namespace <name>         # Create namespace
kubectl delete namespace <name>         # Delete namespace
kubectl config set-context --current --namespace=<ns>
```

### Pods
```bash
kubectl get pods                        # List pods
kubectl get pods -o wide                # With node info
kubectl get pods --all-namespaces       # All namespaces
kubectl get pods -w                     # Watch
kubectl describe pod <pod>              # Detailed info
kubectl get pod <pod> -o yaml           # Full YAML output
kubectl logs <pod>                      # Logs
kubectl logs <pod> -f                   # Follow logs
kubectl logs <pod> -c <container>       # Specific container
kubectl logs <pod> --previous           # Previous container logs
kubectl exec -it <pod> -- /bin/sh       # Shell into pod
kubectl exec <pod> -- <command>         # Run command
kubectl cp <pod>:/src /dest             # Copy from pod
kubectl cp /src <pod>:/dest             # Copy to pod
kubectl delete pod <pod>                # Delete pod
kubectl delete pods -l app=nginx        # Delete by label
```

### Deployments
```bash
kubectl get deployments                 # List deployments
kubectl create deployment nginx --image=nginx:alpine
kubectl delete deployment <name>
kubectl scale deployment <name> --replicas=3
kubectl rollout status deployment/<name>
kubectl rollout history deployment/<name>
kubectl rollout undo deployment/<name>
kubectl rollout undo deployment/<name> --to-revision=2
kubectl set image deployment/<name> nginx=nginx:1.21
kubectl apply -f deployment.yaml        # Apply from file
kubectl apply -f ./manifests/           # Apply directory
kubectl delete -f deployment.yaml       # Delete from file
```

### Services
```bash
kubectl get services                    # List services
kubectl get svc -o wide
kubectl expose deployment nginx --type=LoadBalancer --port=80
kubectl port-forward svc/<name> 8080:80   # Local port forward
kubectl port-forward pod/<pod> 8080:80    # Pod port forward
kubectl delete service <name>
```

### ConfigMaps & Secrets
```bash
kubectl get configmaps
kubectl create configmap <name> --from-file=app.conf
kubectl create configmap <name> --from-literal=key=value
kubectl get configmap <name> -o yaml
kubectl get secrets
kubectl create secret generic <name> --from-literal=password=secret
kubectl create secret tls <name> --cert= cert= --key=key.pem
kubectl describe secret <name>
```

### Ingress
```bash
kubectl get ingress
kubectl get ingress -o wide
kubectl describe ingress <name>
kubectl delete ingress <name>
```

### Jobs & CronJobs
```bash
kubectl get jobs
kubectl get cronjobs
kubectl create job <name> --from=cronjob/<cronjob-name>
kubectl delete job <name>
```

### StatefulSets & DaemonSets
```bash
kubectl get statefulsets
kubectl get daemonsets
kubectl rollout status statefulset/<name>
```

### Resource Management
```bash
kubectl top pod                         # Pod resource usage
kubectl top pod --containers
kubectl get resourcequota
kubectl get limitrange
kubectl describe node <node>            # Node capacity/allocatable
```

### RBAC
```bash
kubectl get serviceaccounts
kubectl get roles
kubectl get rolebindings
kubectl get clusterroles
kubectl get clusterrolebindings
kubectl auth can-i <verb> <resource>    # Check permissions
kubectl auth can-i <verb> <resource> --as=<user>
```

### Storage
```bash
kubectl get pv                          # Persistent Volumes
kubectl get pvc                         # Persistent Volume Claims
kubectl get storageclass
kubectl describe pv <name>
```

### Events & Debugging
```bash
kubectl get events --sort-by='.lastTimestamp'
kubectl get events --field-selector type=Warning
kubectl describe pod <pod>              # Events at bottom
kubectl logs <pod> --previous           # Previous crashed pod
kubectl debug <pod> -it --image=busybox -- /bin/sh
kubectl run debug --rm -it --image=busybox -- /bin/sh
```

### Shortnames
| Long | Short |
|------|-------|
| pods | po |
| services | svc |
| deployments | deploy |
| replicasets | rs |
| daemonsets | ds |
| statefulsets | sts |
| configmaps | cm |
| secrets | sec |
| nodes | no |
| namespaces | ns |
| ingresses | ing |
| persistentvolumes | pv |
| persistentvolumeclaims | pvc |
| serviceaccounts | sa |

---

## Examples

### Run a one-off pod
```bash
kubectl run nginx --image=nginx --restart=Never --rm -it -- /bin/sh
```

### Get pod YAML
```bash
kubectl get pod <pod> -o yaml > pod.yaml
```

### Scale by editing
```bash
kubectl edit deployment <name>
# Change replicas field
```

### Label/annotate
```bash
kubectl label pods <pod> env=prod
kubectl annotate pods <pod> description="production"
```

### Dry run
```bash
kubectl apply -f deployment.yaml --dry-run=client
kubectl apply -f deployment.yaml --dry-run=server
```

---

## Tips

- Use `k` alias: `alias k=kubectl` + `complete -o default -F __start_kubectl k`
- Specify namespace every time: `k -n <ns> get pods` or `-n` flag
- `kubectl explain pod.spec` — great for field documentation
- `kubectl get all` — gets pods, services, deployments, replicasets
- JSONPath for queries: `k get pods -o jsonpath='{.items[*].metadata.name}'`
- `-o custom-columns=...` for tabular output of specific fields

---
*Generated via cheatsheet skill on 2026-05-10*
