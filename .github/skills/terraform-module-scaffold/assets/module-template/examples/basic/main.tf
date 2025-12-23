module "example" {
  source = "../../"
  name   = "example"

  tags = {
    env = "dev"
  }
}
