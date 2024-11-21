
# components = {
#   frontend = {
#     name          = "frontend"
#     instance_type = "t3.small"
#     port_no       = 80
#   }

#   mysql = {
#     name          = "mysql"
#     instance_type = "t3.micro"
#     port_no       = 3306
#   }

#   backend = {
#     name          = "backend"
#     instance_type = "t3.small"
#     port_no       = 8080
#   }
# }

# prometheus_node = ["172.31.85.80/32"]

env = "dev"

vpc = {
  main = {
    vpc_cidr_block  = "10.0.0.0/16"
    lb_subnet_cidr  = ["10.0.0.0/24", "10.0.1.0/24"]
    eks_subnet_cidr = ["10.0.2.0/24", "10.0.3.0/24"]
    db_subnet_cidr  = ["10.0.4.0/24", "10.0.5.0/24"]
    azs             = ["us-east-1a", "us-east-1b"]

    default_vpc_id   = "vpc-0031cc952da0c7bfc"
    default_vpc_cidr = "172.31.0.0/16"
    default_vpc_rt   = "rtb-0623fe36206b96d65"
  }
}

tags = {
  project_name = "expense"
  created_with = "terraform"
  bu           = "ecomm"
}

eks = {
  main = {
    eks_version = "1.31"
    node_groups = {
      ng1 = {
        instance_type = ["t3.medium"]
        capacity_type = "SPOT"
        node_min_size = 1
        node_max_size = 3
      }
    }
  }
}


rds = {
  main = {
    engine         = "mysql"
    engine_version = "8.0"
    family         = "mysql8.0"
    instance_class = "db.t3.micro"
  }
}