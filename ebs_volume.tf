resource "aws_ebs_volume" "data-vol" {
 availability_zone = "ap-south-1a"
 size = 1
 tags = {
        Name = "data-volume"
 }

}

resource "aws_volume_attachment" "dp-vol" {
 device_name = "/dev/sdc"
 volume_id = "${aws_ebs_volume.data-vol.id}"
 instance_id = "${aws_instance.first-os.id}"
}