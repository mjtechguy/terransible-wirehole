variable "oracle_api_key_fingerprint" {}
variable "oracle_api_private_key_path" {}

variable "ssh_public_key" {}
variable "ssh_private_key_path" {}

variable "compartment_ocid" {}
variable "tenancy_ocid" {}
variable "user_ocid" {}

variable "region" {}

variable "free_tier_availability_domain" {}

variable "instance_display_name" {
  default = "WireHole"
}

variable "vcn_cidr_block" {
  default = "10.1.0.0/16"
}

variable "availability_domain_number" {
  default = 1
}

variable "instance_shape" {
  # Free-Tier is VM.Standard.E2.1.Micro
  default = "VM.Standard.E2.1.Micro"
}


variable "instance_image_ocid" {
  type = map

  default = {
    # See https://docs.cloud.oracle.com/en-us/iaas/images/image/cc81a889-bc7f-4b70-b8e7-0503812665be/
    # Oracle-provided image "Canonical-Ubuntu-20.04-2020.07.16-0"
    ap-chuncheon-1   = "ocid1.image.oc1.ap-chuncheon-1.aaaaaaaaxujsghybkqnfrendff6w2cm2wzq4u6xyf5gdhuyxolldc3nec6eq"
    ap-hyderabad-1   = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaagmiee3vtatn3pkdiidemyoi26el4shi4yoyuume7ywoclikwzgca"
    ap-melbourne-1   = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaapagtjdrn4o3a2kwaawlec2rxn7lcgvgxtydibjm4xjbwc7ru5ciq"
    ap-mumbai-1      = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaay7vv6gl6sk267jzdijwmx2ly4tl4lrxdolqvznd54c5s5ovwfp3a"
    ap-osaka-1       = "ocid1.image.oc1.ap-osaka-1.aaaaaaaacge5lfsrasbnf2dd5day6pjyq7gvvxe3q6y5niazwix5gm42txwq"
    ap-seoul-1       = "ocid1.image.oc1.ap-seoul-1.aaaaaaaaujmt5nm6wh5zhygcxanhah4jut3iubrdjzxcccit54yuvo3hjqba"
    ap-sydney-1      = "ocid1.image.oc1.ap-sydney-1.aaaaaaaal7lfjzmdj4erkd3afoxutdug6jk5jkvv5syby3pciig6qawnh64a"
    ap-tokyo-1       = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaafcf5dugfzepbmibvahy57zrfacbgmvs2yxknoqvyf4bgnb3q5sza"
    ca-montreal-1    = "ocid1.image.oc1.ca-montreal-1.aaaaaaaausdoo477iiz3sr75vhv3ixdf2vottphejewg7hnu3ke4cnuo7xea"
    ca-toronto-1     = "ocid1.image.oc1.ca-toronto-1.aaaaaaaa6rwnup6ytsizk6cvuoid6dabk33e3242mkyyml7xgqcqz3u5ox3q"
    eu-amsterdam-1   = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaamye2o6jdr6a4cdznautk75rbsl3fhuwf2t6krdert4aemhhd4vma"
    eu-frankfurt-1   = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaamvlp7o2nxwvh7uk4zf7x7cvupe2crm4u6vhbf4a2fe5nupbltxza"
    eu-zurich-1      = "ocid1.image.oc1.eu-zurich-1.aaaaaaaax7c4eu6p2mqyamjqhyd2qy3k7bdk24kn7odt3oxtzbebzvwf4n7a"
    me-jeddah-1      = "ocid1.image.oc1.me-jeddah-1.aaaaaaaa3axbj3sqspxo4xsaqugaalvpbl65kkvjyamanwbzheejg5im6mqq"
    sa-saopaulo-1    = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaa43nhxgl7mm57gssiqc4ajotp6awanjxn2m2cbju7qyic6cm3rtsq"
    uk-london-1      = "ocid1.image.oc1.uk-london-1.aaaaaaaaxux5lh6zv4ph4d24zrwoxku6c7bi6i5xqesxcicsnninpnhplxvq"
    us-ashburn-1     = "ocid1.image.oc1.iad.aaaaaaaa4zmhh435fbohrt6cwwomyfkcnrrr3ce2czs2qs52eadlu7mr45va"
    us-gov-ashburn-1 = "ocid1.image.oc3.us-gov-ashburn-1.aaaaaaaaiz3q5ax2kvxyw6trvvvtc4sdqsndp75b53djvpfn4hj5hphl5xna"
    us-gov-chicago-1 = "ocid1.image.oc3.us-gov-chicago-1.aaaaaaaahr6euutuq3argqjaj6uiboipnvetm5tsnldsinkbwbca2xy6r3wq"
    us-gov-phoenix-1 = "ocid1.image.oc3.us-gov-phoenix-1.aaaaaaaaaoccj2ljjik45azehgpken5wb2bncwripogtp2qlov6itmbltzda"
    us-langley-1     = "ocid1.image.oc2.us-langley-1.aaaaaaaat4xdlgjuqtk5dnd7map3nqgt4rkssgvfpknuzdbo4cst7vd7isoq"
    us-luke-1        = "ocid1.image.oc2.us-luke-1.aaaaaaaanh73rftzyh7wtrouhuvn3iee4uyyvvuddtzryue5srnstl3o3ima"
    us-phoenix-1     = "ocid1.image.oc1.phx.aaaaaaaao3t2yjoowutaq2h66d5i4h424i2tyhycad7qeqpryjit4phv2t7q"
    us-sanjose-1     = "ocid1.image.oc1.us-sanjose-1.aaaaaaaagodsnhz5md2r6iusytuqjgq35omfj2phd4tzelwr7xfcw7u6mmia"
}

