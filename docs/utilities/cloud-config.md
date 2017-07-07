# Cloud Config

The file `./util/deploy-init.yml` is a [Cloud Config](http://cloudinit.readthedocs.io/en/latest/index.html)
configuration which can be used to bootstrap new nodes that can be added to the
cluster. New nodes will have a user `deploy` created, who belongs to the `sudo`
group. In addition, this user is allowed full passwordless `sudo` privileges.
SSH keys are added via the GitHub convenience `https://github.com/<user>.keys`.

### Local Simulation With LXC

[LXC](https://linuxcontainers.org/) can be used along with `./util/deploy-init.yml`
to simulate a node locally. The following commands will create a profile that
mimics the setup used for bootstrapping live nodes.

```
# Create and configure a new profile
lxc profile create eclipse
lxc profile set eclipse user.user-data - < util/deploy-init.yml

# Launch a new container 'TEST1'
lxc launch [<remote>:]<image> TEST1 -p default -p eclipse

# Login to container
lxc exec TEST1 bash
```
