from os.path import join as path_join, dirname
from setuptools import setup, find_packages

version = '0.1.2'

with open("README.md", "r") as fh:
    long_description = fh.read()

with open("requirements.txt", "r") as fh:
    install_reqs = fh.read().split()

setup(
    name='gitlab-project-export',
    version=version,
    description=('Simple python project for exporting gitlab projects '
                 'with Export Project feature in GitLab API.'),
    long_description=long_description,
    long_description_content_type="text/markdown",
    include_package_data=True,
    author='Petru Giurca',
    author_email='petru.giurca@axsys.ro',
    url='https://github.com/petrugiurca/gitlab-project-export',
    download_url='https://github.com/petrugiurca/gitlab-project-export/archive/master.tar.gz',
    packages=find_packages(),
    install_requires = install_reqs,
    scripts=[
        'gitlab-project-export.py',
    ],
    keywords=['gitlab-backup', 'gitlab-export', 'export', 'gitlab', 'backup'],
    classifiers=[
        'Programming Language :: Python :: 3',
    ],
)
