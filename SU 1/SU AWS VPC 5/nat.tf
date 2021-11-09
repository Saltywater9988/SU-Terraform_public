# nat gw
resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.SU-public-1.id
  depends_on    = [aws_internet_gateway.SU-gw]
}

# VPC setup for NAT
resource "aws_route_table" "SU-private" {
  vpc_id = aws_vpc.SU.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "SU-private-1"
  }
}

# route associations private
resource "aws_route_table_association" "SU-private-1-a" {
  subnet_id      = aws_subnet.SU-private-1.id
  route_table_id = aws_route_table.SU-private.id
}

resource "aws_route_table_association" "SU-private-2-a" {
  subnet_id      = aws_subnet.SU-private-2.id
  route_table_id = aws_route_table.SU-private.id
}

resource "aws_route_table_association" "SU-private-3-a" {
  subnet_id      = aws_subnet.SU-private-3.id
  route_table_id = aws_route_table.SU-private.id
}

