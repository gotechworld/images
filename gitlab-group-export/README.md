## Export GitLab CI Groups

Group Export allows you to export group structure and import it to a new location (NXRM3 instance).

Group exports include the following:

+ Group milestones
+ Group boards
+ Group labels
+ Group badges
+ Group members
+ Subgroups. Each subgroup includes all data above
+ Group wikis


### Prerequisites

+ Python 3
+ text editor / IDE
+ NXRM3 endpoint

### How does it run?

+ Be aware of the `.env` file where you will inject your `URI` and your `ACCESS_TOKEN` of the GitLab CI instance.
+ Then open the `GitLab-Groups.xlsx` file where you will find all the `Groups ID` which you will need to parse into the `export.py` file.
+ For more details use the `groups.py` file where even here you will parse the `Groups ID`.
+ As you may already see, each subfolder has his own python script. Make sure to parse your NXRM3 credentials into the `nexus/script.sh`

![GitLab](https://w7.pngwing.com/pngs/694/277/png-transparent-logo-version-control-gitlab-brand-e-commerce-gitlab-text-orange-logo-thumbnail.png)
