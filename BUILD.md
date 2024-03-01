## Creating a CIFEN release

#### 1. Prepare the environment

Install go (https://go.dev/doc/install)

Install cosign (https://docs.sigstore.dev/system\_config/installation/)
Create a cosign key pair (https://docs.sigstore.dev/signing/quickstart/)

Set the environment variable COSIGN\_PASSWORD with the value so that cast can use the key. (This must be done whether or not you assign a password when creating the key pair.

Install cast (https://github.com/ekristen/cast)


#### 2. Create the release

After making the necessary modifications/additions to your Salt states and files, edit the `VERSION` file in the checked out repository directory to match the intended version.

Next, push your changes:

```bash
$ git add -A
$ git commit -m '<message here>'
$ git push
$ git tag vYOUR-VERSION && git push origin --tags
```

Where YOUR-VERSION is the intended version (for example "0.1.0"). Once the push is complete, return to the root of the checkout out repository folder and run:

`$ cast release --github-token YOUR-GITHUB-TOKEN

The release should now appear in the Releases page of your GitHub repo.

#### Step 3 - Subsequent releases

Assuming your development environment has not changed, future releases may be created following just the instructions in 2.

