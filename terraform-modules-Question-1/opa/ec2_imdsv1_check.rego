package ec2_imdsv1_check

default match = false

match {
    input.Reservations[_].Instances[_].MetadataOptions.HttpTokens == "optional"
}