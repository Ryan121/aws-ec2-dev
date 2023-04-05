 # Need/Requirement
    As a User: I want to use a Amazon Linux EKS optimised AMI configured for use in AWSSo that: 
    I can make use of a centrally produced AMI configured with default software AWS publish a build 
    specification for EKS images: https://github.com/awslabs/amazon-eks-ami relates to DEVSO-657 & DEVSO-658.

    We need to understand what they do to optimise it so we know what/if any packages are being installed, 
    what they do and how it works etc. so we know it's safe and secure to deploy.

# Queries

   - Are all of the currently installed packages safe/cleared for use (for our applications) and do they meet the 
   necessary security requirements (E.g. openssh and others are currently installed) ?

   - By default, Kubernetes binaries are downloaded from the Amazon EKS public Amazon Simple Storage Service (Amazon S3)
   bucket amazon-eks in us-west-2. Can these binaries be used or do we have to create our own which then can be used to
   build the EKS image?

   - An instance is launched and Packer runs the `install-worker.sh` script (see in DIR) on the instance to install software and perform other
   necessary configuration tasks, then creating an AMI from the instance. Are there any hardening steps/installs missing from this script
   that are required for our EKS related applications?

# Progress & Ticket Outcome

   An EC2 instance (ubuntu image) was spun up and the git repo (https://github.com/awslabs/amazon-eks-ami) was cloned.
   Packer was installed with make to run the run make file and initiate packer builds. The make file was run for several 
   image versions that ouput a .json file that includes all installed dependencies/packages.

   It was determined in a meeting on 17/03/23 that the use of the repo and the public binaries would be used for EKS image creation
   within the project as the git repo (https://github.com/awslabs/amazon-eks-ami) is maintained by AWS and all the dependencies installed 
   come from AWS repos. Also any vunerabilities would be detected at a later time when testing the created image.


