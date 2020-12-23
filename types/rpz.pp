type Unbound::Rpz = Struct[{
    primary             => Optional[Array[Stdlib::Host]],
    master              => Optional[Array[Stdlib::Host]],
    url                 => Optional[Array[Stdlib::HTTPUrl]],
    allow_notify        => Optional[Array[Variant[Stdlib::Fqdn, Stdlib::IP::Address]]],
    zonefile            => Optional[Stdlib::Unixpath],
    rpz_action_overrude => Optional[Unbound::Rpz::Action],
    rpz_cname_override  => Optional[Stdlib::Fqdn],
    rpz_log             => Optional[Boolean],
    rpz_log_name        => Optional[String],
    tags                => Optional[Array[String]],
}]

