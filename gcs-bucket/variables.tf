variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
}

variable "bucket_location" {
  description = "The location of the bucket"
  type        = string
  default     = "EU"
}

variable "main_page_suffix" {
  description = "The main page suffix"
  type        = string
  default     = "index.html"
}

