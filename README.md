The issue was that terraform could not write our application load balancer logs to the provisioned s3 bucket with our desired policy so this is the debug process to finding a solution

- running a terraform destroy starting from scratch

- changing bucket acl in the s3 module to public-read-write to observe behavior 

- read up on aws documentation and saw that they were passing in load balancer id in the first block of the JSON code with provided IDs for given regions so I modified the code and put the given ID for us-east-1 in the first block instead of our account number 

- LINK: https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-access-logs.html >> this is the documentation im referring to 

- Ok so the bucket is now able to receive logs - but we need to make this work with a PRIVATE s3 bucket not public 

- Made some slight modifications to the s3.tf file >> parsed through the web and found this "aws_s3_bucket_public_access_block" on terraform documentation, perhaps we can use this to override the s3.tf bucket acl - will be adding this into code to observe behavior. LINK FOR DOCUMENTATION: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block 

- Going to terraform destroy and test this on fresh installation now

- It worked!

- EXIT CRITERIA MET >> REFER TO SCREENSHOTS :)


