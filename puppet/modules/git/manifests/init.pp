# install git

class git::install {
    package{'git':
        ensure=>present,
    }
}
