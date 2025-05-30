# Kubernetes Hugging Face Mirror

## Deployment

```bash
helm repo add olah https://surajssd.github.io/k8s-hf-mirror
helm repo update
helm upgrade -i --wait \
    --create-namespace \
    --namespace olah \
    olah \
    olah/olah
```

## Using the cache with vLLM

Ensure that the vLLM deployment has the following environment variable set:

```bash
export HF_ENDPOINT=http://olah.olah:18090
```

### Testing Locally

Start a local port-forward to the service:

```bash
kubectl -n olah port-forward svc/olah 18090
```

Install the `huggingface-cli`:

```bash
virtualenv venv
source venv/bin/activate
pip install -U "huggingface_hub[cli]"
```

Run the following to use the deployment as a cache:

```bash
export HF_ENDPOINT=http://localhost:18090
rm -rf ~/.cache/huggingface/hub/models--facebook--mms-tts-sml/
huggingface-cli download facebook/mms-tts-sml
```
