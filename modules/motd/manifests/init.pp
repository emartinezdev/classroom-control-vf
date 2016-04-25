file { '/etc/motd':
  ensure  => 'present',
  content => 'Welcome to your puppet classroom container!',
}

