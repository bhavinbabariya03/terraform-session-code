# # variable "region" {
# #   type = string
# # }

# # variable "isVerified" {
# #   type = bool
# #   default = false
# # }

# # output "region" {
# #   value = var.region
# # }


# # variable "array" {
# #   type = list(string)
# #   default = [ "one", "two", "three" ]
# # }

# variable "person" {
#   type = map(string)
#   default = {
#     "firstName" = "bhavin"
#     "lastName" = "babariya"
#   }
# }



# # variable "unique_arr" {
# #   type = set(number)
# #   default = [ 1,2,2,3,3,3,3,4,5,5,5,6,7 ]
# # }

# # output "unique_arr" {
# #   value = var.unique_arr
# # }

# output "person" {
#   value = var.person.first
# }
# # output "array" {
# # value = var.array
# # }