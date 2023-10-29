# Some commons errors

````git
 Error: No value for required variable
│ 
│   on variables.tf line 1:
│    1: variable "user_uuid" {
│ 
│ The root module input variable "user_uuid" is not set, and has no default
│ value. Use a -var or -var-file command line argument to provide a value for
│ this variable.
````
1. Create the ``user_uuid`` variable in Terraform Cloud
2. Pass a value to ``user_uuid`` with ``-var``
3. Pass a ``-var-file``
   
   ```
    tf plan -var user_uuid="3cad5985-89e3-455d-8349-3cb385bed8d0"  or
    tf plan -var-file terraforms.tfvars
   ```