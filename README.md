The issue was that terraform could not write our application load balancer logs to the provisioned s3 bucket with our desired policy so this is the debug process to finding a solution

- running a terraform destroy starting from scratch

- changing bucket acl in the s3 module to public-read-write to observe behavior 

- read up on aws documentation and saw that they were passing in load balancer id in the first block of the JSON code with provided IDs for given regions so I modified the code and put the given ID for us-east-1 in the first block instead of our account number 

- LINK: https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-access-logs.html >> this is the documentation im referring to 

- Ok so the bucket is now able to receive logs - exit criteria met refer to screenshots

- Made some slight modifications to the arn code line - to make it cleaner I took out the account # because upon going into the s3 bucket it turns out the account #
ends up being made as a folder so to keep the buckets file directory I just kept the bucket name / AWSLogs / so the file structure would be easier to navigate 


