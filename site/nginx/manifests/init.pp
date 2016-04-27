class nginx {

  $pkg = 'nginx'
  $svc = 'nginx'

  package { $pkg: 
    ensure => present,
  }

  File {
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # DOCROOT
  file { '/var/www':
    ensure  => 'directory',
  }


  # WEB PAGE
  file { '/var/www/index.html':
    ensure  => 'file',
    source  => 'puppet:///modules/nginx/index.html',
  }


  # CONFIG FILES
  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    source  => 'puppet:///modules/nginx/nginx.conf',
    require => Package[$pkg],
    notify  => Service[$pkg],
  }

  file { '/etc/nginx/conf.d/default.conf':
    ensure  => file,
    source  => 'puppet:///modules/nginx/default.conf',
    notify  => Service[$svc],
    require => Package[$pkg],
  } 

  # SERVICE
  service { 'svc':
    ensure  => running,
    enable  => true,
  }
  


}
