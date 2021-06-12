# AWS WAFv2
At all for waf

## Getting Started
```terraform init```

```terraform plan```

```terraform apply```

## IDE Tooling
### VS Code
- https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform
- https://marketplace.visualstudio.com/items?itemName=4ops.terraform

## Notes
- Terraform state is compatible from in 1.0.x from 0.14.x and 0.15.x
- Testing approach https://www.hashicorp.com/blog/testing-hashicorp-terraform

## TODO
- allow rules (which ever feels more better-er)
    - via json templates in a dir 
    - via passed vars
- maybe allow associations via passed in params
    - does it feel better to encapsulate logic with more params 
    - or to let the calling module/resource manage the relationship (stay more generic here)
- a ton of detail for props and features (visibility as a feature, rules, rule groups, etc...)
- testing when the approach is determined