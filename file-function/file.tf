output "printFile" {
  value = file("${path.module}/file.txt")
}