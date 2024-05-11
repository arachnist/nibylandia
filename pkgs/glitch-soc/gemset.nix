{
  actioncable = {
    dependencies = ["actionpack" "activesupport" "nio4r" "websocket-driver" "zeitwerk"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ifiz4nd6a34z2n8lpdgvlgwziy2g364b0xzghiqd3inji0cwqp1";
      type = "gem";
    };
    version = "7.1.3.2";
  };
  actionmailbox = {
    dependencies = ["actionpack" "activejob" "activerecord" "activestorage" "activesupport" "mail" "net-imap" "net-pop" "net-smtp"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1adqnf5zc4fdr71ykxdv5b50h7n4xfvrc0qcgwmgidi0cxkzx4r4";
      type = "gem";
    };
    version = "7.1.3.2";
  };
  actionmailer = {
    dependencies = ["actionpack" "actionview" "activejob" "activesupport" "mail" "net-imap" "net-pop" "net-smtp" "rails-dom-testing"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "012mxn5dfhwbssrckw6kvf851m6rlfa87n4nikk28g05ydfsvcys";
      type = "gem";
    };
    version = "7.1.3.2";
  };
  actionpack = {
    dependencies = ["actionview" "activesupport" "nokogiri" "racc" "rack" "rack-session" "rack-test" "rails-dom-testing" "rails-html-sanitizer"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0n1v4r5cyac5wfdlf8bly45mnh60vbp067yjpkyb05vyszamiydq";
      type = "gem";
    };
    version = "7.1.3.2";
  };
  actiontext = {
    dependencies = ["actionpack" "activerecord" "activestorage" "activesupport" "globalid" "nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0an5sfy96cbd7f43igq47h3m228ivngqjj40gj6iqllhjhchgs7c";
      type = "gem";
    };
    version = "7.1.3.2";
  };
  actionview = {
    dependencies = ["activesupport" "builder" "erubi" "rails-dom-testing" "rails-html-sanitizer"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kq9b4xnwiknjqg4y6ixvv0cf1z0dcxs68inc8bx05s0fqrim6rn";
      type = "gem";
    };
    version = "7.1.3.2";
  };
  active_model_serializers = {
    dependencies = ["actionpack" "activemodel" "case_transform" "jsonapi-renderer"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13n1ipn0dg3k852xhfzdvkr1ljq76xvfnm79qzdix2ishiy1gphl";
      type = "gem";
    };
    version = "0.10.14";
  };
  activejob = {
    dependencies = ["activesupport" "globalid"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08gjywvd65yzgjw7ynsgvi00scxc4fmgj70wajn7wsdqx00hbafj";
      type = "gem";
    };
    version = "7.1.3.2";
  };
  activemodel = {
    dependencies = ["activesupport"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0p3ibps515151ja4gadrhh8frvjvvq4h5fpxw2acccv3z5i553hh";
      type = "gem";
    };
    version = "7.1.3.2";
  };
  activerecord = {
    dependencies = ["activemodel" "activesupport" "timeout"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ww1qxn12nlp0ivysq0pxj6cvajf0fbq781fr4pqx5206c690wj8";
      type = "gem";
    };
    version = "7.1.3.2";
  };
  activestorage = {
    dependencies = ["actionpack" "activejob" "activerecord" "activesupport" "marcel"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "09wp0qqp7xr31ipcv42bs81fmyksz9l3jmraryf53qjsbbqpfdr8";
      type = "gem";
    };
    version = "7.1.3.2";
  };
  activesupport = {
    dependencies = ["base64" "bigdecimal" "concurrent-ruby" "connection_pool" "drb" "i18n" "minitest" "mutex_m" "tzinfo"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0blbbf2x7dn7ar4g9aij403582zb6zscbj48bz63lvaamsvlb15d";
      type = "gem";
    };
    version = "7.1.3.2";
  };
  addressable = {
    dependencies = ["public_suffix"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0irbdwkkjwzajq1ip6ba46q49sxnrl2cw7ddkdhsfhb6aprnm3vr";
      type = "gem";
    };
    version = "2.8.6";
  };
  aes_key_wrap = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "19bn0y70qm6mfj4y1m0j3s8ggh6dvxwrwrj5vfamhdrpddsz8ddr";
      type = "gem";
    };
    version = "1.1.0";
  };
  android_key_attestation = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02spc1sh7zsljl02v9d5rdb717b628vw2k7jkkplifyjk4db0zj6";
      type = "gem";
    };
    version = "0.3.0";
  };
  annotate = {
    dependencies = ["activerecord" "rake"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lw0fxb5mirsdp3bp20gjyvs7clvi19jbxnrm2ihm20kzfhvlqcs";
      type = "gem";
    };
    version = "3.2.0";
  };
  ast = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04nc8x27hlzlrr5c2gn7mar4vdr0apw5xg22wp6m8dx3wqr04a0y";
      type = "gem";
    };
    version = "2.4.2";
  };
  attr_required = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16fbwr6nmsn97n0a6k1nwbpyz08zpinhd6g7196lz1syndbgrszh";
      type = "gem";
    };
    version = "1.0.2";
  };
  awrence = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gj8f8c54r9cabkm41s59sa1ca5wpbipw7gq3sfl87x9296227fx";
      type = "gem";
    };
    version = "1.2.1";
  };
  aws-eventstream = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gvdg4yx4p9av2glmp7vsxhs0n8fj1ga9kq2xdb8f95j7b04qhzi";
      type = "gem";
    };
    version = "1.3.0";
  };
  aws-partitions = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ifkc90g5afwsfqaayw1sq1i0spvz7kx99sgsa5xx5h55g143j9d";
      type = "gem";
    };
    version = "1.922.0";
  };
  aws-sdk-core = {
    dependencies = ["aws-eventstream" "aws-partitions" "aws-sigv4" "jmespath"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yk0jb9h0iyqglxi53n7yzhxsia6nvir80zfsvg6kbkjp3ba7irs";
      type = "gem";
    };
    version = "3.194.1";
  };
  aws-sdk-kms = {
    dependencies = ["aws-sdk-core" "aws-sigv4"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1rga6qkp038laxsl3wl2lig9yyaj788xg8aczl1wyhsdy1bi6qjm";
      type = "gem";
    };
    version = "1.80.0";
  };
  aws-sdk-s3 = {
    dependencies = ["aws-sdk-core" "aws-sdk-kms" "aws-sigv4"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0sm44q9877bs69ik10x908wr4h12gigccpcvqxnlhaylj20n0kk6";
      type = "gem";
    };
    version = "1.149.1";
  };
  aws-sigv4 = {
    dependencies = ["aws-eventstream"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1g3w27wzjy4si6kp49w10as6ml6g6zl3xrfqs5ikpfciidv9kpc4";
      type = "gem";
    };
    version = "1.8.0";
  };
  azure-storage-blob = {
    dependencies = ["azure-storage-common" "nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qq3knsy7nj7a0r8m19spg2bgzns9b3j5vjbs9mpg49whhc63dv1";
      type = "gem";
    };
    version = "2.0.3";
  };
  azure-storage-common = {
    dependencies = ["faraday" "faraday_middleware" "net-http-persistent" "nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0swmsvvpmy8cdcl305p3dl2pi7m3dqjd7zywfcxmhsz0n2m4v3v0";
      type = "gem";
    };
    version = "2.0.4";
  };
  base64 = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01qml0yilb9basf7is2614skjp8384h2pycfx86cr8023arfj98g";
      type = "gem";
    };
    version = "0.2.0";
  };
  bcp47_spec = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "043qld01c163yc7fxlar3046dac2833rlcg44jbbs9n1jvgjxmiz";
      type = "gem";
    };
    version = "0.2.1";
  };
  bcrypt = {
    groups = ["default" "pam_authentication"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16a0g2q40biv93i1hch3gw8rbmhp77qnnifj1k0a6m7dng3zh444";
      type = "gem";
    };
    version = "3.1.20";
  };
  better_errors = {
    dependencies = ["erubi" "rack" "rouge"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wqazisnn6hn1wsza412xribpw5wzx6b5z5p4mcpfgizr6xg367p";
      type = "gem";
    };
    version = "2.10.1";
  };
  bigdecimal = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gi7zqgmqwi5lizggs1jhc3zlwaqayy9rx2ah80sxy24bbnng558";
      type = "gem";
    };
    version = "3.1.8";
  };
  bindata = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08r67nglsqnxrbn803szf5bdnqhchhq8kf2by94f37fcl65wpp19";
      type = "gem";
    };
    version = "2.5.0";
  };
  binding_of_caller = {
    dependencies = ["debug_inspector"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16mjj15ks5ws53v2y31hxcmf46d0qjdvdaadpk7xsij2zymh4a9b";
      type = "gem";
    };
    version = "1.0.1";
  };
  blurhash = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "057afgqy73n8vm7k3cr4pbwm1hhqnm58lp4x7bgm5wzbs39m7xf8";
      type = "gem";
    };
    version = "0.1.7";
  };
  bootsnap = {
    dependencies = ["msgpack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1srlq3gqirzdkhv12ljpnp5cb0f8jfrl3n8xs9iivyz2c7khvdyp";
      type = "gem";
    };
    version = "1.18.3";
  };
  brakeman = {
    dependencies = ["racc"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lylig4vgnw9l1ybwgxdi9nw9q2bc5dcplklg8nsbi7j32f7c5kp";
      type = "gem";
    };
    version = "6.1.2";
  };
  browser = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0g4bcpax07kqqr9cp7cjc7i0pcij4nqpn1rdsg2wdwhzf00m6x32";
      type = "gem";
    };
    version = "5.3.1";
  };
  brpoplpush-redis_script = {
    dependencies = ["concurrent-ruby" "redis"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nd5zj5yqmhv9lrsqz8s2dqq28v4ywy95qrw7nzhhf89dl4dq49l";
      type = "gem";
    };
    version = "0.1.3";
  };
  builder = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "045wzckxpwcqzrjr353cxnyaxgf0qg22jh00dcx7z38cys5g1jlr";
      type = "gem";
    };
    version = "3.2.4";
  };
  bundler-audit = {
    dependencies = ["thor"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gdx0019vj04n1512shhdx7hwphzqmdpw4vva2k551nd47y1dixx";
      type = "gem";
    };
    version = "0.9.1";
  };
  capybara = {
    dependencies = ["addressable" "matrix" "mini_mime" "nokogiri" "rack" "rack-test" "regexp_parser" "xpath"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vxfah83j6zpw3v5hic0j70h519nvmix2hbszmjwm8cfawhagns2";
      type = "gem";
    };
    version = "3.40.0";
  };
  case_transform = {
    dependencies = ["activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fzyws6spn5arqf6q604dh9mrj84a36k5hsc8z7jgcpfvhc49bg2";
      type = "gem";
    };
    version = "0.2";
  };
  cbor = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dsf9gjc2cj79vrnz2vgq573biqjw7ad4b0idm05xg6rb3y9gq4y";
      type = "gem";
    };
    version = "0.5.9.8";
  };
  charlock_holmes = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hybw8jw9ryvz5zrki3gc9r88jqy373m6v46ynxsdzv1ysiyr40p";
      type = "gem";
    };
    version = "0.7.7";
  };
  chewy = {
    dependencies = ["activesupport" "elasticsearch" "elasticsearch-dsl"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0kgqj7hcs09ln7i1rds1xify08rzjk02ryzvjdvnllg1fkh3vm2b";
      type = "gem";
    };
    version = "7.6.0";
  };
  chunky_png = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1znw5x86hmm9vfhidwdsijz8m38pqgmv98l9ryilvky0aldv7mc9";
      type = "gem";
    };
    version = "1.4.0";
  };
  climate_control = {
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "198aswdyqlvcw9jkd95b7b8dp3fg0wx89kd1dx9wia1z36b1icin";
      type = "gem";
    };
    version = "1.2.0";
  };
  cocoon = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "038z97pkhvsqbh6cmyyzj58ya968p24k7r0f0rx7sa2kjvk193yh";
      type = "gem";
    };
    version = "1.2.15";
  };
  color_diff = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01dpvqlzybpb3pkcwd9ik5sbjw283618ywvdphxslhiy8ps3kp4r";
      type = "gem";
    };
    version = "0.1";
  };
  concurrent-ruby = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qh1b14jwbbj242klkyz5fc7npd4j0mvndz62gajhvl1l3wd7zc2";
      type = "gem";
    };
    version = "1.2.3";
  };
  connection_pool = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1x32mcpm2cl5492kd6lbjbaf17qsssmpx9kdyr7z1wcif2cwyh0g";
      type = "gem";
    };
    version = "2.4.1";
  };
  cose = {
    dependencies = ["cbor" "openssl-signature_algorithm"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00c6x4ha7qiaaf88qdbyf240mk146zz78rbm4qwyaxmwlmk7q933";
      type = "gem";
    };
    version = "1.3.0";
  };
  crack = {
    dependencies = ["bigdecimal" "rexml"];
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jaa7is4fw1cxigm8vlyhg05bw4nqy4f91zjqxk7pp4c8bdyyfn8";
      type = "gem";
    };
    version = "1.0.0";
  };
  crass = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0pfl5c0pyqaparxaqxi6s4gfl21bdldwiawrc0aknyvflli60lfw";
      type = "gem";
    };
    version = "1.0.6";
  };
  css_parser = {
    dependencies = ["addressable"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1rhqn05w27w2mjrf0a6ppb4fxpxbfvyhwgdxa8z886jr4qnhywzb";
      type = "gem";
    };
    version = "1.17.1";
  };
  csv = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0zfn40dvgjk1xv1z8l11hr9jfg3jncwsc9yhzsz4l4rivkpivg8b";
      type = "gem";
    };
    version = "3.3.0";
  };
  database_cleaner-active_record = {
    dependencies = ["activerecord" "database_cleaner-core"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12hdsqnws9gyc9sxiyc8pjiwr0xa7136m1qbhmd1pk3vsrrvk13k";
      type = "gem";
    };
    version = "2.1.0";
  };
  database_cleaner-core = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0v44bn386ipjjh4m2kl53dal8g4d41xajn2jggnmjbhn6965fil6";
      type = "gem";
    };
    version = "2.0.1";
  };
  date = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "149jknsq999gnhy865n33fkk22s0r447k76x9pmcnnwldfv2q7wp";
      type = "gem";
    };
    version = "3.3.4";
  };
  debug = {
    dependencies = ["irb" "reline"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1z77qyzcmvz3ciny6cb24s79a243jqkybqk30b310yichp02dq28";
      type = "gem";
    };
    version = "1.9.2";
  };
  debug_inspector = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18k8x9viqlkh7dbmjzh8crbjy8w480arpa766cw1dnn3xcpa1pwv";
      type = "gem";
    };
    version = "1.2.0";
  };
  devise = {
    dependencies = ["bcrypt" "orm_adapter" "railties" "responders" "warden"];
    groups = ["default" "pam_authentication"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1y57fpcvy1kjd4nb7zk7mvzq62wqcpfynrgblj558k3hbvz4404j";
      type = "gem";
    };
    version = "4.9.4";
  };
  devise-two-factor = {
    dependencies = ["activesupport" "devise" "railties" "rotp"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hh0yc85ixnan90hibz3nba6pamhscxfr1zaymxgv3vw5icv50ya";
      type = "gem";
    };
    version = "5.0.0";
  };
  devise_pam_authenticatable2 = {
    dependencies = ["devise" "rpam2"];
    groups = ["pam_authentication"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13ipl52pkhc6vxp8ca31viwv01237bi2bfk3b1fixq1x46nf87p2";
      type = "gem";
    };
    version = "9.2.0";
  };
  diff-lcs = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1znxccz83m4xgpd239nyqxlifdb7m8rlfayk6s259186nkgj6ci7";
      type = "gem";
    };
    version = "1.5.1";
  };
  discard = {
    dependencies = ["activerecord"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rysimck60hkj1japwb2np75kaf4jq8jvfzijh2izhadrabqj8am";
      type = "gem";
    };
    version = "1.3.0";
  };
  docile = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lxqxgq71rqwj1lpl9q1mbhhhhhhdkkj7my341f2889pwayk85sz";
      type = "gem";
    };
    version = "1.4.0";
  };
  domain_name = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cyr2xm576gqhqicsyqnhanni47408w2pgvrfi8pd13h2li3nsaz";
      type = "gem";
    };
    version = "0.6.20240107";
  };
  doorkeeper = {
    dependencies = ["railties"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0w02d1124mrzbagh2xplbzkpy0ykfs52f3rpyaa3zg6div0zvs13";
      type = "gem";
    };
    version = "5.6.9";
  };
  dotenv = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0y24jabiz4cf9ni9vi4j8sab8b5phpf2mpw3981r0r94l4m6q0q8";
      type = "gem";
    };
    version = "3.1.2";
  };
  drb = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0h5kbj9hvg5hb3c7l425zpds0vb42phvln2knab8nmazg2zp5m79";
      type = "gem";
    };
    version = "2.2.1";
  };
  ed25519 = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0zb2dr2ihb1qiknn5iaj1ha1w9p7lj9yq5waasndlfadz225ajji";
      type = "gem";
    };
    version = "1.3.0";
  };
  elasticsearch = {
    dependencies = ["elasticsearch-api" "elasticsearch-transport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1g3y2h1fi8bx2ad3n7y6hfwq22691xnbp1h3af440qs8dgripwp3";
      type = "gem";
    };
    version = "7.17.10";
  };
  elasticsearch-api = {
    dependencies = ["multi_json"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1k1qnf3y1rc0i2cj182j2qn6bj63z3lw0rw2hbbksbvgv0pmlc1a";
      type = "gem";
    };
    version = "7.17.10";
  };
  elasticsearch-dsl = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "174m3fwm3mawbkjg2xbmqvljq7ava4s95m8vpg5khcvfj506wxfk";
      type = "gem";
    };
    version = "0.1.10";
  };
  elasticsearch-transport = {
    dependencies = ["faraday" "multi_json"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0prvwp083mayfggifcjnwjpnw5arw8v6qw9w8fb56lagsrpwgfhj";
      type = "gem";
    };
    version = "7.17.10";
  };
  email_spec = {
    dependencies = ["htmlentities" "launchy" "mail"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yhn60bmbyv10ikypp5zqrwyg0jfswyvnfqngy18r0dj5p458g7m";
      type = "gem";
    };
    version = "2.2.2";
  };
  erubi = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08s75vs9cxlc4r1q2bjg4br8g9wc5lc5x5vl0vv4zq5ivxsdpgi7";
      type = "gem";
    };
    version = "1.12.0";
  };
  et-orbi = {
    dependencies = ["tzinfo"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0r6zylqjfv0xhdxvldr0kgmnglm57nm506pcm6085f0xqa68cvnj";
      type = "gem";
    };
    version = "1.2.11";
  };
  excon = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1m3gzvp1wqki0yh4b7761qhdy4pyr4phy429b7s9w25nrkhp4lsz";
      type = "gem";
    };
    version = "0.110.0";
  };
  fabrication = {
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1al5iv3as21l5clci0b5cg27z136pan7gkj7plp4l0w83c6z2y9c";
      type = "gem";
    };
    version = "2.31.0";
  };
  faker = {
    dependencies = ["i18n"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0isxcqv4xkw7hrdf89mga6zsi4alban16xyw84bkqvbsr859nax4";
      type = "gem";
    };
    version = "3.3.1";
  };
  faraday = {
    dependencies = ["faraday-em_http" "faraday-em_synchrony" "faraday-excon" "faraday-httpclient" "faraday-multipart" "faraday-net_http" "faraday-net_http_persistent" "faraday-patron" "faraday-rack" "faraday-retry" "ruby2_keywords"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1c760q0ks4vj4wmaa7nh1dgvgqiwaw0mjr7v8cymy7i3ffgjxx90";
      type = "gem";
    };
    version = "1.10.3";
  };
  faraday-em_http = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12cnqpbak4vhikrh2cdn94assh3yxza8rq2p9w2j34bqg5q4qgbs";
      type = "gem";
    };
    version = "1.0.0";
  };
  faraday-em_synchrony = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vgrbhkp83sngv6k4mii9f2s9v5lmp693hylfxp2ssfc60fas3a6";
      type = "gem";
    };
    version = "1.0.0";
  };
  faraday-excon = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0h09wkb0k0bhm6dqsd47ac601qiaah8qdzjh8gvxfd376x1chmdh";
      type = "gem";
    };
    version = "1.1.0";
  };
  faraday-httpclient = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fyk0jd3ks7fdn8nv3spnwjpzx2lmxmg2gh4inz3by1zjzqg33sc";
      type = "gem";
    };
    version = "1.0.1";
  };
  faraday-multipart = {
    dependencies = ["multipart-post"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "09871c4hd7s5ws1wl4gs7js1k2wlby6v947m2bbzg43pnld044lh";
      type = "gem";
    };
    version = "1.0.4";
  };
  faraday-net_http = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fi8sda5hc54v1w3mqfl5yz09nhx35kglyx72w7b8xxvdr0cwi9j";
      type = "gem";
    };
    version = "1.0.1";
  };
  faraday-net_http_persistent = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0dc36ih95qw3rlccffcb0vgxjhmipsvxhn6cw71l7ffs0f7vq30b";
      type = "gem";
    };
    version = "1.2.0";
  };
  faraday-patron = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "19wgsgfq0xkski1g7m96snv39la3zxz6x7nbdgiwhg5v82rxfb6w";
      type = "gem";
    };
    version = "1.0.0";
  };
  faraday-rack = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1h184g4vqql5jv9s9im6igy00jp6mrah2h14py6mpf9bkabfqq7g";
      type = "gem";
    };
    version = "1.0.0";
  };
  faraday-retry = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "153i967yrwnswqgvnnajgwp981k9p50ys1h80yz3q94rygs59ldd";
      type = "gem";
    };
    version = "1.0.3";
  };
  faraday_middleware = {
    dependencies = ["faraday"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1bw8mfh4yin2xk7138rg3fhb2p5g2dlmdma88k82psah9mbmvlfy";
      type = "gem";
    };
    version = "1.2.0";
  };
  fast_blank = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1shpmamyzyhyxmv95r96ja5rylzaw60r19647d0fdm7y2h2c77r6";
      type = "gem";
    };
    version = "1.0.1";
  };
  fastimage = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1sfc7svf7h1ja6zmsq9f3ps6pg0q4hymphh6rk7ipmp7ygqjkii3";
      type = "gem";
    };
    version = "2.3.1";
  };
  ffi = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yvii03hcgqj30maavddqamqy50h7y6xcn2wcyq72wn823zl4ckd";
      type = "gem";
    };
    version = "1.16.3";
  };
  ffi-compiler = {
    dependencies = ["ffi" "rake"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1844j58cdg2q6g0rqfwg4rrambnhf059h4yg9rfmrbrcs60kskx9";
      type = "gem";
    };
    version = "1.3.2";
  };
  fog-core = {
    dependencies = ["builder" "excon" "formatador" "mime-types"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0p2xiw0n4l1k3ynma1vl0fzw5w8xhkv70x4f829nydxv7hply80y";
      type = "gem";
    };
    version = "2.4.0";
  };
  fog-json = {
    dependencies = ["fog-core" "multi_json"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zj8llzc119zafbmfa4ai3z5s7c4vp9akfs0f9l2piyvcarmlkyx";
      type = "gem";
    };
    version = "1.2.0";
  };
  fog-openstack = {
    dependencies = ["fog-core" "fog-json"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1xh9qs00l1d7rxsr9qjlba8dprh9km8ya06y59qf17vncihl1xa7";
      type = "gem";
    };
    version = "1.1.0";
  };
  formatador = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1l06bv4avphbdmr1y4g0rqlczr38k6r65b3zghrbj2ynyhm3xqjl";
      type = "gem";
    };
    version = "1.1.0";
  };
  fugit = {
    dependencies = ["et-orbi" "raabro"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10m9b2gvwfvmm61000mq7n8q7pk2xkxmizgfydpis66n2ybrhwh5";
      type = "gem";
    };
    version = "1.10.1";
  };
  fuubar = {
    dependencies = ["rspec-core" "ruby-progressbar"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1028vn7j3kc5qqwswrf3has3qm4j9xva70xmzb3n29i89f0afwmj";
      type = "gem";
    };
    version = "2.5.1";
  };
  globalid = {
    dependencies = ["activesupport"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1sbw6b66r7cwdx3jhs46s4lr991969hvigkjpbdl7y3i31qpdgvh";
      type = "gem";
    };
    version = "1.2.1";
  };
  google-protobuf = {
    groups = ["default" "opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1mnxzcq8kmyfb9bkzqnp019d1hx1vprip3yzdkkha6b3qz5rgg9r";
      type = "gem";
    };
    version = "3.25.3";
  };
  googleapis-common-protos-types = {
    dependencies = ["google-protobuf"];
    groups = ["default" "opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0lg51gh8n6c0a38vin94zf0k9qz32hd9y8wqjpqljnkhjfzgpkix";
      type = "gem";
    };
    version = "1.14.0";
  };
  haml = {
    dependencies = ["temple" "thor" "tilt"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15yxph91zswbnfy7szpdcfbdfqqn595ff290hm4f6fcnhryvhvlf";
      type = "gem";
    };
    version = "6.3.0";
  };
  haml-rails = {
    dependencies = ["actionpack" "activesupport" "haml" "railties"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1sjrdwc4azzfpsp2xk0365z031482gcrs0c54d5wx0igkqca0fr7";
      type = "gem";
    };
    version = "2.1.0";
  };
  haml_lint = {
    dependencies = ["haml" "parallel" "rainbow" "rubocop" "sysexits"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1mf24djxk6968n0ypwbib790nzijcf03m4kw0dnks8csfxj6hy9g";
      type = "gem";
    };
    version = "0.58.0";
  };
  hashdiff = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jf9dxgjz6z7fvymyz2acyvn9iyvwkn6d9sk7y4fxwbmfc75yimm";
      type = "gem";
    };
    version = "1.1.0";
  };
  hashie = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nh3arcrbz1rc1cr59qm53sdhqm137b258y8rcb4cvd3y98lwv4x";
      type = "gem";
    };
    version = "5.0.0";
  };
  hcaptcha = {
    dependencies = ["json"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fh6391zlv2ikvzqj2gymb70k1avk1j9da8bzgw0scsz2wqq98m2";
      type = "gem";
    };
    version = "7.1.0";
  };
  highline = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02ghhvigqbq4252gsi4w8a9klkdkybmbz29ghfp1y6sqzlcb466a";
      type = "gem";
    };
    version = "3.0.1";
  };
  hiredis = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04jj8k7lxqxw24sp0jiravigdkgsyrpprxpxm71ba93x1wr2w1bz";
      type = "gem";
    };
    version = "0.6.3";
  };
  hkdf = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04fixg0a51n4vy0j6c1hvisa2yl33m3jrrpxpb5sq6j511vjriil";
      type = "gem";
    };
    version = "0.3.0";
  };
  htmlentities = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nkklqsn8ir8wizzlakncfv42i32wc0w9hxp00hvdlgjr7376nhj";
      type = "gem";
    };
    version = "4.3.4";
  };
  http = {
    dependencies = ["addressable" "base64" "http-cookie" "http-form_data" "llhttp-ffi"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05b1khh7wxga9jviy9yi8z1nckxbm3svlzv40y0zvq3nag3d77mr";
      type = "gem";
    };
    version = "5.2.0";
  };
  http-cookie = {
    dependencies = ["domain_name"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13rilvlv8kwbzqfb644qp6hrbsj82cbqmnzcvqip1p6vqx36sxbk";
      type = "gem";
    };
    version = "1.0.5";
  };
  http-form_data = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1wx591jdhy84901pklh1n9sgh74gnvq1qyqxwchni1yrc49ynknc";
      type = "gem";
    };
    version = "2.3.0";
  };
  http_accept_language = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0d0nlfz9vm4jr1l6q0chx4rp2hrnrfbx3gadc1dz930lbbaz0hq0";
      type = "gem";
    };
    version = "2.1.1";
  };
  httpclient = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "19mxmvghp7ki3klsxwrlwr431li7hm1lczhhj8z4qihl2acy8l99";
      type = "gem";
    };
    version = "2.8.3";
  };
  httplog = {
    dependencies = ["rack" "rainbow"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vmcrsvi1x9ppxsp8pg4nwcxmqcqw9gyasx4sbcz3brqr39mr3zs";
      type = "gem";
    };
    version = "1.6.3";
  };
  i18n = {
    dependencies = ["concurrent-ruby"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ffix518y7976qih9k1lgnc17i3v6yrlh0a3mckpxdb4wc2vrp16";
      type = "gem";
    };
    version = "1.14.5";
  };
  i18n-tasks = {
    dependencies = ["activesupport" "ast" "erubi" "highline" "i18n" "parser" "rails-i18n" "rainbow" "terminal-table"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1v03380ffwwa84xzsc6dhkc57cs156qx5aij4bfdcs1j5bpxmn1s";
      type = "gem";
    };
    version = "1.0.14";
  };
  idn-ruby = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0dy04jx3n1ddz744b80mg7hp87miysnjp0h21lqr43hpmhdglxih";
      type = "gem";
    };
    version = "0.1.5";
  };
  inline_svg = {
    dependencies = ["activesupport" "nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1mimwp5d6j52n4givnsyhmym3173rv4bfirhmlcxc7s05qymwk7l";
      type = "gem";
    };
    version = "1.9.0";
  };
  io-console = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08d2lx42pa8jjav0lcjbzfzmw61b8imxr9041pva8xzqabrczp7h";
      type = "gem";
    };
    version = "0.7.2";
  };
  irb = {
    dependencies = ["rdoc" "reline"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14pji5w708d6v63m3yvyfx1d9gg0mi5x1a2czxf6259zncq2ymda";
      type = "gem";
    };
    version = "1.13.1";
  };
  jmespath = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cdw9vw2qly7q7r41s7phnac264rbsdqgj4l0h4nqgbjb157g393";
      type = "gem";
    };
    version = "1.6.2";
  };
  json = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0b4qsi8gay7ncmigr0pnbxyb17y3h8kavdyhsh7nrlqwr35vb60q";
      type = "gem";
    };
    version = "2.7.2";
  };
  json-canonicalization = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0illsmkly0hhi24lm1l6jjjdr6jykvydkwi1cxf4ad3mra68m16l";
      type = "gem";
    };
    version = "1.0.0";
  };
  json-jwt = {
    dependencies = ["activesupport" "aes_key_wrap" "bindata" "httpclient"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13xhvkh2fxydcf466az172nwfykzppm3g9ckp8mafsib45w77clj";
      type = "gem";
    };
    version = "1.15.3.1";
  };
  json-ld = {
    dependencies = ["htmlentities" "json-canonicalization" "link_header" "multi_json" "rack" "rdf"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1carfj87p6cpd0xnysg5sj653rqmmwnnacsmjk42xdy40j15gp88";
      type = "gem";
    };
    version = "3.3.1";
  };
  json-ld-preloaded = {
    dependencies = ["json-ld" "rdf"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1f28ipp845xmqkgd0c22lw5fpv4fiama4ms3z1z5p0kbvi22f2c1";
      type = "gem";
    };
    version = "3.3.0";
  };
  json-schema = {
    dependencies = ["addressable"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ljqbpjc5aa8a2cgq8f64iwbx7rr9dqvpk7v8n5jpslyz6mvyddc";
      type = "gem";
    };
    version = "4.3.0";
  };
  jsonapi-renderer = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ys4drd0k9rw5ixf8n8fx8v0pjh792w4myh0cpdspd317l1lpi5m";
      type = "gem";
    };
    version = "0.2.2";
  };
  jwt = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16z11alz13vfc4zs5l3fk6n51n2jw9lskvc4h4prnww0y797qd87";
      type = "gem";
    };
    version = "2.7.1";
  };
  kaminari = {
    dependencies = ["activesupport" "kaminari-actionview" "kaminari-activerecord" "kaminari-core"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gia8irryvfhcr6bsr64kpisbgdbqjsqfgrk12a11incmpwny1y4";
      type = "gem";
    };
    version = "1.2.2";
  };
  kaminari-actionview = {
    dependencies = ["actionview" "kaminari-core"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02f9ghl3a9b5q7l079d3yzmqjwkr4jigi7sldbps992rigygcc0k";
      type = "gem";
    };
    version = "1.2.2";
  };
  kaminari-activerecord = {
    dependencies = ["activerecord" "kaminari-core"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0c148z97s1cqivzbwrak149z7kl1rdmj7dxk6rpkasimmdxsdlqd";
      type = "gem";
    };
    version = "1.2.2";
  };
  kaminari-core = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zw3pg6kj39y7jxakbx7if59pl28lhk98fx71ks5lr3hfgn6zliv";
      type = "gem";
    };
    version = "1.2.2";
  };
  kt-paperclip = {
    dependencies = ["activemodel" "activesupport" "marcel" "mime-types" "terrapin"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1j8z0757rb4kly4ghdzd6ihch6x5i0d53r543x2y9xa8cyrj7c4m";
      type = "gem";
    };
    version = "7.2.2";
  };
  language_server-protocol = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gvb1j8xsqxms9mww01rmdl78zkd72zgxaap56bhv8j45z05hp1x";
      type = "gem";
    };
    version = "3.17.0.3";
  };
  launchy = {
    dependencies = ["addressable"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06r43899384das2bkbrpsdxsafyyqa94il7111053idfalb4984a";
      type = "gem";
    };
    version = "2.5.2";
  };
  letter_opener = {
    dependencies = ["launchy"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cnv3ggnzyagl50vzs1693aacv08bhwlprcvjp8jcg2w7cp3zwrg";
      type = "gem";
    };
    version = "1.10.0";
  };
  letter_opener_web = {
    dependencies = ["actionmailer" "letter_opener" "railties" "rexml"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0vvvaz2ngaxv0s6sj25gdvp73vd8pfl8q3jharadg18p3va0m1ik";
      type = "gem";
    };
    version = "2.0.0";
  };
  link_header = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yamrdq4rywmnpdhbygnkkl9fdy249fg5r851nrkkxr97gj5rihm";
      type = "gem";
    };
    version = "0.0.8";
  };
  llhttp-ffi = {
    dependencies = ["ffi-compiler" "rake"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yph78m8w8l6i9833fc7shy5krk4mnqjc7ys0bg9kgxw8jnl0vs9";
      type = "gem";
    };
    version = "0.5.0";
  };
  lograge = {
    dependencies = ["actionpack" "activesupport" "railties" "request_store"];
    groups = ["production"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qcsvh9k4c0cp6agqm9a8m4x2gg7vifryqr7yxkg2x9ph9silds2";
      type = "gem";
    };
    version = "0.14.0";
  };
  loofah = {
    dependencies = ["crass" "nokogiri"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zkjqf37v2d7s11176cb35cl83wls5gm3adnfkn2zcc61h3nxmqh";
      type = "gem";
    };
    version = "2.22.0";
  };
  mail = {
    dependencies = ["mini_mime" "net-imap" "net-pop" "net-smtp"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1bf9pysw1jfgynv692hhaycfxa8ckay1gjw5hz3madrbrynryfzc";
      type = "gem";
    };
    version = "2.8.1";
  };
  marcel = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "190n2mk8m1l708kr88fh6mip9sdsh339d2s6sgrik3sbnvz4jmhd";
      type = "gem";
    };
    version = "1.0.4";
  };
  mario-redis-lock = {
    dependencies = ["redis"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1v9wdjcjqzpns2migxp4a5b4w82mipi0fwihbqz3q2qj2qm7wc17";
      type = "gem";
    };
    version = "1.2.1";
  };
  matrix = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1h2cgkpzkh3dd0flnnwfq6f3nl2b1zff9lvqz8xs853ssv5kq23i";
      type = "gem";
    };
    version = "0.4.2";
  };
  md-paperclip-azure = {
    dependencies = ["addressable" "azure-storage-blob" "hashie"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hb1a06x3i8zrhl715jf46ha8r4iy0srcpdhnmp9l14qnnhzn0l5";
      type = "gem";
    };
    version = "2.2.0";
  };
  memory_profiler = {
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1c81d68r4wx0ckbmqxlfqc2qpd94jwcmqdm0xgr0s46r48pv9k9q";
      type = "gem";
    };
    version = "1.0.1";
  };
  mime-types = {
    dependencies = ["mime-types-data"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1r64z0m5zrn4k37wabfnv43wa6yivgdfk6cf2rpmmirlz889yaf1";
      type = "gem";
    };
    version = "3.5.2";
  };
  mime-types-data = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00x7w5xqsj9m33v3vkmy23wipkkysafksib53ypzn27p5g81w455";
      type = "gem";
    };
    version = "3.2024.0305";
  };
  mini_mime = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vycif7pjzkr29mfk4dlqv3disc5dn0va04lkwajlpr1wkibg0c6";
      type = "gem";
    };
    version = "1.1.5";
  };
  mini_portile2 = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "149r94xi6b3jbp6bv72f8383b95ndn0p5sxnq11gs1j9jadv0ajf";
      type = "gem";
    };
    version = "2.8.6";
  };
  minitest = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "07lq26b86giy3ha3fhrywk9r1ajhc2pm2mzj657jnpnbj1i6g17a";
      type = "gem";
    };
    version = "5.22.3";
  };
  msgpack = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1a5adcb7bwan09mqhj3wi9ib52hmdzmqg7q08pggn3adibyn5asr";
      type = "gem";
    };
    version = "1.7.2";
  };
  multi_json = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0pb1g1y3dsiahavspyzkdy39j4q377009f6ix0bh1ag4nqw43l0z";
      type = "gem";
    };
    version = "1.15.0";
  };
  multipart-post = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1033p35166d9p97y4vajbbvr13pmkk9zwn7sylxpmk9jrpk8ri67";
      type = "gem";
    };
    version = "2.4.0";
  };
  mutex_m = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ma093ayps1m92q845hmpk0dmadicvifkbf05rpq9pifhin0rvxn";
      type = "gem";
    };
    version = "0.2.0";
  };
  net-http = {
    dependencies = ["uri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10n2n9aq00ih8v881af88l1zyrqgs5cl3njdw8argjwbl5ggqvm9";
      type = "gem";
    };
    version = "0.4.1";
  };
  net-http-persistent = {
    dependencies = ["connection_pool"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0i1as2lgnw7b4jid0gw5glv5hnxz36nmfsbr9rmxbcap72ijgy03";
      type = "gem";
    };
    version = "4.0.2";
  };
  net-imap = {
    dependencies = ["date" "net-protocol"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0zn7j2w0hc622ig0rslk4iy6yp3937dy9ibhyr1mwwx39n7paxaj";
      type = "gem";
    };
    version = "0.4.10";
  };
  net-ldap = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0g9gz39bs2iy4ky4fhjphimqd9m9wdsaz50anxgwg3yjrff3famy";
      type = "gem";
    };
    version = "0.19.0";
  };
  net-pop = {
    dependencies = ["net-protocol"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1wyz41jd4zpjn0v1xsf9j778qx1vfrl24yc20cpmph8k42c4x2w4";
      type = "gem";
    };
    version = "0.1.2";
  };
  net-protocol = {
    dependencies = ["timeout"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1a32l4x73hz200cm587bc29q8q9az278syw3x6fkc9d1lv5y0wxa";
      type = "gem";
    };
    version = "0.2.2";
  };
  net-smtp = {
    dependencies = ["net-protocol"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0amlhz8fhnjfmsiqcjajip57ici2xhw089x7zqyhpk51drg43h2z";
      type = "gem";
    };
    version = "0.5.0";
  };
  nio4r = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15iwbiij52x6jhdbl0rkcldnhfndmsy0sbnsygkr9vhskfqrp72m";
      type = "gem";
    };
    version = "2.7.1";
  };
  nokogiri = {
    dependencies = ["mini_portile2" "racc"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0i8g0i370jhn2sclml0bg9qlrgf4csi6sy7czbhx8kjbl71idhb2";
      type = "gem";
    };
    version = "1.16.4";
  };
  nsa = {
    dependencies = ["activesupport" "concurrent-ruby" "sidekiq" "statsd-ruby"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1narh0bj0c9pg8cb2jhpydfa9mnm3dclckzk5s6xrwa2gm99hnk4";
      type = "gem";
    };
    version = "0.3.0";
  };
  oj = {
    dependencies = ["bigdecimal"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0g5nx99lrwmk6ynfaacqkyijnhvi4mckm77bmvpa0jmfg068l26h";
      type = "gem";
    };
    version = "3.16.3";
  };
  omniauth = {
    dependencies = ["hashie" "rack" "rack-protection"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1km0wqx9pj609jidvrqfsvzbzfgdnlpdnv7i7xfqm3wb55vk5w6y";
      type = "gem";
    };
    version = "2.1.2";
  };
  omniauth-cas = {
    dependencies = ["addressable" "nokogiri" "omniauth"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13z686dmkdssm4d5b0k45ydavhjrzcaqzyqxvvmaqn3a0vc6klbs";
      type = "gem";
    };
    version = "3.0.0";
  };
  omniauth-rails_csrf_protection = {
    dependencies = ["actionpack" "omniauth"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kwswnkyl8ym6i4wv65qh3qchqbf2n0c6lbhfgbvkds3gpmnlm7w";
      type = "gem";
    };
    version = "1.0.1";
  };
  omniauth-saml = {
    dependencies = ["omniauth" "ruby-saml"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01k9rkg97npcgm8r4x3ja8y20hsg4zy0dcjpzafx148q4yxbg74n";
      type = "gem";
    };
    version = "2.1.0";
  };
  omniauth_openid_connect = {
    dependencies = ["omniauth" "openid_connect"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08yl0x203k6nrshc70zawfqh79ap1c3fyka9zwwy61cvn7sih4sz";
      type = "gem";
    };
    version = "0.6.1";
  };
  openid_connect = {
    dependencies = ["activemodel" "attr_required" "json-jwt" "net-smtp" "rack-oauth2" "swd" "tzinfo" "validate_email" "validate_url" "webfinger"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1k9kdivp45v6vhzdrnl5fzhd378gjj2hl4w9bazbqnfm15rsnzc8";
      type = "gem";
    };
    version = "1.4.2";
  };
  openssl = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "054d6ybgjdzxw567m7rbnd46yp6gkdbc5ihr536vxd3p15vbhjrw";
      type = "gem";
    };
    version = "3.2.0";
  };
  openssl-signature_algorithm = {
    dependencies = ["openssl"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "103yjl68wqhl5kxaciir5jdnyi7iv9yckishdr52s5knh9g0pd53";
      type = "gem";
    };
    version = "1.3.0";
  };
  opentelemetry-api = {
    groups = ["default" "opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1j9c2a4wgw0jaw63qscfasw3lf3kr45q83p4mmlf0bndcq2rlgdb";
      type = "gem";
    };
    version = "1.2.5";
  };
  opentelemetry-common = {
    dependencies = ["opentelemetry-api"];
    groups = ["default" "opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pp7i09wp5kp1npp3l8my06p7g06cglb1bi61nw8k3x5sj275kgq";
      type = "gem";
    };
    version = "0.20.1";
  };
  opentelemetry-exporter-otlp = {
    dependencies = ["google-protobuf" "googleapis-common-protos-types" "opentelemetry-api" "opentelemetry-common" "opentelemetry-sdk" "opentelemetry-semantic_conventions"];
    groups = ["opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16836gysf2cqzwx8zhx5p8vrfzmws622dc43d59y6x2cjakyw7gw";
      type = "gem";
    };
    version = "0.26.3";
  };
  opentelemetry-helpers-sql-obfuscation = {
    dependencies = ["opentelemetry-common"];
    groups = ["default" "opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cnlr3gqmd2q9wcaxhvlkxkbjvvvkp4vzcwif1j7kydw7lvz2vmw";
      type = "gem";
    };
    version = "0.1.0";
  };
  opentelemetry-instrumentation-action_pack = {
    dependencies = ["opentelemetry-api" "opentelemetry-instrumentation-base" "opentelemetry-instrumentation-rack"];
    groups = ["default" "opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16nbkayp8jb2zkqj2rmqd4d1mz4wdf0zg6jx8b0vzkf9mxr89py5";
      type = "gem";
    };
    version = "0.9.0";
  };
  opentelemetry-instrumentation-action_view = {
    dependencies = ["opentelemetry-api" "opentelemetry-instrumentation-active_support" "opentelemetry-instrumentation-base"];
    groups = ["default" "opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xfbqgw497k2f56f68k7zsvmrrk5jk69xhl56227dfxlw15p2z5w";
      type = "gem";
    };
    version = "0.7.0";
  };
  opentelemetry-instrumentation-active_job = {
    dependencies = ["opentelemetry-api" "opentelemetry-instrumentation-base"];
    groups = ["opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12c0qr980zr4si2ps55aj3zj84zycg3zcf16nh6mizljkmn8096s";
      type = "gem";
    };
    version = "0.7.1";
  };
  opentelemetry-instrumentation-active_model_serializers = {
    dependencies = ["opentelemetry-api" "opentelemetry-instrumentation-base"];
    groups = ["opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1apgldckz3snr7869al0z18rgfplalya3x9pil3lqp4jziczhiwc";
      type = "gem";
    };
    version = "0.20.1";
  };
  opentelemetry-instrumentation-active_record = {
    dependencies = ["opentelemetry-api" "opentelemetry-instrumentation-base"];
    groups = ["default" "opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wjfd1dmfzcnvss2jsnc2s3g6p0wfq5ay3vfnidkmisgyw7fphfk";
      type = "gem";
    };
    version = "0.7.2";
  };
  opentelemetry-instrumentation-active_support = {
    dependencies = ["opentelemetry-api" "opentelemetry-instrumentation-base"];
    groups = ["default" "opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rjajgb7sj3mrw5d79xm7q3f4mns1fc3ngasjfw10i18x0kq7283";
      type = "gem";
    };
    version = "0.5.1";
  };
  opentelemetry-instrumentation-base = {
    dependencies = ["opentelemetry-api" "opentelemetry-registry"];
    groups = ["default" "opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0pv064ksiynin8hzvljkwm5vlkgr8kk6g3qqpiwcik860i7l677n";
      type = "gem";
    };
    version = "0.22.3";
  };
  opentelemetry-instrumentation-concurrent_ruby = {
    dependencies = ["opentelemetry-api" "opentelemetry-instrumentation-base"];
    groups = ["opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1xmx1rxdvf835kvad352rcavwkk3x758q0rznx2npay3mm8bbcbg";
      type = "gem";
    };
    version = "0.21.3";
  };
  opentelemetry-instrumentation-excon = {
    dependencies = ["opentelemetry-api" "opentelemetry-common" "opentelemetry-instrumentation-base"];
    groups = ["opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13f19fw3ffg13g2w9kh4x84plrnhf9c0yxxm15dl3lycsbji2hvs";
      type = "gem";
    };
    version = "0.22.1";
  };
  opentelemetry-instrumentation-faraday = {
    dependencies = ["opentelemetry-api" "opentelemetry-common" "opentelemetry-instrumentation-base"];
    groups = ["opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ax6pd5sgrwdcck9pa6vfcz1b971b1s83spyrrfkpxpsz40hl0gk";
      type = "gem";
    };
    version = "0.24.2";
  };
  opentelemetry-instrumentation-http = {
    dependencies = ["opentelemetry-api" "opentelemetry-instrumentation-base"];
    groups = ["opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yncpv6i2cagjyq1srdqddf6mh0q9s04kfi9q1rh9qbsxqbp5cff";
      type = "gem";
    };
    version = "0.23.3";
  };
  opentelemetry-instrumentation-http_client = {
    dependencies = ["opentelemetry-api" "opentelemetry-common" "opentelemetry-instrumentation-base"];
    groups = ["opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lzc5y63qqpryic9nw1wlwdawcyi0b6gzbsxwrpk88ikwanvhxjg";
      type = "gem";
    };
    version = "0.22.4";
  };
  opentelemetry-instrumentation-net_http = {
    dependencies = ["opentelemetry-api" "opentelemetry-common" "opentelemetry-instrumentation-base"];
    groups = ["opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1klq4rpn803byrz7z1mxsj81qg7kpl67nj5sqqw41msnwkkbay18";
      type = "gem";
    };
    version = "0.22.4";
  };
  opentelemetry-instrumentation-pg = {
    dependencies = ["opentelemetry-api" "opentelemetry-helpers-sql-obfuscation" "opentelemetry-instrumentation-base"];
    groups = ["opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1bpw2vnn5yir8avqymrpcnxp08fmq8kwa7lsvn5rbqxyvaywbfx1";
      type = "gem";
    };
    version = "0.27.2";
  };
  opentelemetry-instrumentation-rack = {
    dependencies = ["opentelemetry-api" "opentelemetry-common" "opentelemetry-instrumentation-base"];
    groups = ["opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ayf153y1qfdphz109jlblbw5wx38lwfg0dgn20xzzr3660yd831";
      type = "gem";
    };
    version = "0.24.3";
  };
  opentelemetry-instrumentation-rails = {
    dependencies = ["opentelemetry-api" "opentelemetry-instrumentation-action_pack" "opentelemetry-instrumentation-action_view" "opentelemetry-instrumentation-active_job" "opentelemetry-instrumentation-active_record" "opentelemetry-instrumentation-active_support" "opentelemetry-instrumentation-base"];
    groups = ["opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hiihby0lndwvny1alba1mvvag48z55vjjrwbjppb700prv0q1kk";
      type = "gem";
    };
    version = "0.30.1";
  };
  opentelemetry-instrumentation-redis = {
    dependencies = ["opentelemetry-api" "opentelemetry-common" "opentelemetry-instrumentation-base"];
    groups = ["opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pn8f891qy7z6dv2svjnv1f3gqx7mqg3dsp9x5xpd69sr3vbi6jx";
      type = "gem";
    };
    version = "0.25.4";
  };
  opentelemetry-instrumentation-sidekiq = {
    dependencies = ["opentelemetry-api" "opentelemetry-common" "opentelemetry-instrumentation-base"];
    groups = ["opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02i2vycgrradpm9nr4rp69a11fvqsngiirayn1s5j745xiy4x5sd";
      type = "gem";
    };
    version = "0.25.3";
  };
  opentelemetry-registry = {
    dependencies = ["opentelemetry-api"];
    groups = ["default" "opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pw87n9vpv40hf7f6gyl2vvbl11hzdkv4psbbv3x23jvccs8593k";
      type = "gem";
    };
    version = "0.3.1";
  };
  opentelemetry-sdk = {
    dependencies = ["opentelemetry-api" "opentelemetry-common" "opentelemetry-registry" "opentelemetry-semantic_conventions"];
    groups = ["opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ajf9igx63r6r2ds0f3hxd18iragvr88k2k9kzvamp1jkdna6gsi";
      type = "gem";
    };
    version = "1.4.1";
  };
  opentelemetry-semantic_conventions = {
    dependencies = ["opentelemetry-api"];
    groups = ["default" "opentelemetry"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xhv5fwwgjj2k8ksprpg1nm5v8k3w6gyw4wiq2k08q3kf484rlhk";
      type = "gem";
    };
    version = "1.10.0";
  };
  orm_adapter = {
    groups = ["default" "pam_authentication"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fg9jpjlzf5y49qs9mlpdrgs5rpcyihq1s4k79nv9js0spjhnpda";
      type = "gem";
    };
    version = "0.5.0";
  };
  ox = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0w9gavjrvciip497hpdjpcs2c18vf6cgmlj696ynpaqv96804glr";
      type = "gem";
    };
    version = "2.14.18";
  };
  parallel = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15wkxrg1sj3n1h2g8jcrn7gcapwcgxr659ypjf75z1ipkgxqxwsv";
      type = "gem";
    };
    version = "1.24.0";
  };
  parser = {
    dependencies = ["ast" "racc"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0i0255l4pw6c1bc0ny98wx5qck25irinq062ijg4002mj8mydwvq";
      type = "gem";
    };
    version = "3.3.1.0";
  };
  parslet = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01pnw6ymz6nynklqvqxs4bcai25kcvnd5x4id9z3vd1rbmlk0lfl";
      type = "gem";
    };
    version = "2.0.0";
  };
  pastel = {
    dependencies = ["tty-color"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xash2gj08dfjvq4hy6l1z22s5v30fhizwgs10d6nviggpxsj7a8";
      type = "gem";
    };
    version = "0.8.0";
  };
  pg = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "071b55bhsz7mivlnp2kv0a11msnl7xg5awvk8mlflpl270javhsb";
      type = "gem";
    };
    version = "1.5.6";
  };
  pghero = {
    dependencies = ["activerecord"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "127s1qn4dl5cq0xfw6y3pl382wwcmda1ivxs5vi7vccs24l9i53z";
      type = "gem";
    };
    version = "3.4.1";
  };
  premailer = {
    dependencies = ["addressable" "css_parser" "htmlentities"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yvy5lxq287izy7qsz23hry63rc57wkaaalqvxnwjncm56xgdmzh";
      type = "gem";
    };
    version = "1.23.0";
  };
  premailer-rails = {
    dependencies = ["actionmailer" "net-smtp" "premailer"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0004f73kgrglida336fqkgx906m6n05nnfc17mypzg5rc78iaf61";
      type = "gem";
    };
    version = "1.12.0";
  };
  private_address_check = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05phz0vscfh9chv90yc9091pifw3cpwkh76flnhrmvja1q3na4cy";
      type = "gem";
    };
    version = "0.5.0";
  };
  propshaft = {
    dependencies = ["actionpack" "activesupport" "rack" "railties"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0s1bcrdrnz2draqpa3w9rlw5h45nr7nyaqcfjfs9vxcfyx8gmlya";
      type = "gem";
    };
    version = "0.8.0";
  };
  psych = {
    dependencies = ["stringio"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0s5383m6004q76xm3lb732bp4sjzb6mxb6rbgn129gy2izsj4wrk";
      type = "gem";
    };
    version = "5.1.2";
  };
  public_suffix = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14y4vzjwf5gp0mqgs880kis0k7n2biq8i6ci6q2n315kichl1hvj";
      type = "gem";
    };
    version = "5.0.5";
  };
  puma = {
    dependencies = ["nio4r"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0i2vaww6qcazj0ywva1plmjnj6rk23b01szswc5jhcq7s2cikd1y";
      type = "gem";
    };
    version = "6.4.2";
  };
  pundit = {
    dependencies = ["activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18vz32n5ca5j5h971axnnfa8rjrfqnqv0zkgjv8xmbpb05c9m83w";
      type = "gem";
    };
    version = "2.3.2";
  };
  raabro = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10m8bln9d00dwzjil1k42i5r7l82x25ysbi45fwyv4932zsrzynl";
      type = "gem";
    };
    version = "1.4.0";
  };
  racc = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01b9662zd2x9bp4rdjfid07h09zxj7kvn7f5fghbqhzc625ap1dp";
      type = "gem";
    };
    version = "1.7.3";
  };
  rack = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hj0rkw2z9r1lcg2wlrcld2n3phwrcgqcp7qd1g9a7hwgalh2qzx";
      type = "gem";
    };
    version = "2.2.9";
  };
  rack-attack = {
    dependencies = ["rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0z6pj5vjgl6swq7a33gssf795k958mss8gpmdb4v4cydcs7px91w";
      type = "gem";
    };
    version = "6.7.0";
  };
  rack-cors = {
    dependencies = ["rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06ysmn14pdf2wyr7agm0qvvr9pzcgyf39w4yvk2n05w9k4alwpa1";
      type = "gem";
    };
    version = "2.0.2";
  };
  rack-oauth2 = {
    dependencies = ["activesupport" "attr_required" "httpclient" "json-jwt" "rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fknwsxz4429w1hndl6y30cmm2n34wmmaaj2hhp6jrm8ssfsfwjf";
      type = "gem";
    };
    version = "1.21.3";
  };
  rack-protection = {
    dependencies = ["base64" "rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zzvivmdb4dkscc58i3gmcyrnypynsjwp6xgc4ylarlhqmzvlx1w";
      type = "gem";
    };
    version = "3.2.0";
  };
  rack-proxy = {
    dependencies = ["rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12jw7401j543fj8cc83lmw72d8k6bxvkp9rvbifi88hh01blnsj4";
      type = "gem";
    };
    version = "0.7.7";
  };
  rack-session = {
    dependencies = ["rack"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xhxhlsz6shh8nm44jsmd9276zcnyzii364vhcvf0k8b8bjia8d0";
      type = "gem";
    };
    version = "1.0.2";
  };
  rack-test = {
    dependencies = ["rack"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ysx29gk9k14a14zsp5a8czys140wacvp91fja8xcja0j1hzqq8c";
      type = "gem";
    };
    version = "2.1.0";
  };
  rackup = {
    dependencies = ["rack" "webrick"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1wbr03334ba9ilcq25wh9913xciwj0j117zs60vsqm0zgwdkwpp9";
      type = "gem";
    };
    version = "1.0.0";
  };
  rails = {
    dependencies = ["actioncable" "actionmailbox" "actionmailer" "actionpack" "actiontext" "actionview" "activejob" "activemodel" "activerecord" "activestorage" "activesupport" "railties"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "185zq5r9g56sfks852992bm0xf2vm9569jyiz5jyww3vx1jply1d";
      type = "gem";
    };
    version = "7.1.3.2";
  };
  rails-controller-testing = {
    dependencies = ["actionpack" "actionview" "activesupport"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "151f303jcvs8s149mhx2g5mn67487x0blrf9dzl76q1nb7dlh53l";
      type = "gem";
    };
    version = "1.0.5";
  };
  rails-dom-testing = {
    dependencies = ["activesupport" "minitest" "nokogiri"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fx9dx1ag0s1lr6lfr34lbx5i1bvn3bhyf3w3mx6h7yz90p725g5";
      type = "gem";
    };
    version = "2.2.0";
  };
  rails-html-sanitizer = {
    dependencies = ["loofah" "nokogiri"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pm4z853nyz1bhhqr7fzl44alnx4bjachcr6rh6qjj375sfz3sc6";
      type = "gem";
    };
    version = "1.6.0";
  };
  rails-i18n = {
    dependencies = ["i18n" "railties"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0s8kvic2ia34ngssz6h15wqj0k3wwblhyh0f9v0j3gy7ly0dp161";
      type = "gem";
    };
    version = "7.0.9";
  };
  railties = {
    dependencies = ["actionpack" "activesupport" "irb" "rackup" "rake" "thor" "zeitwerk"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0435sfvhhrd4b2ic9b4c2df3i1snryidx7ry9km4805rpxfdbz2r";
      type = "gem";
    };
    version = "7.1.3.2";
  };
  rainbow = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0smwg4mii0fm38pyb5fddbmrdpifwv22zv3d3px2xx497am93503";
      type = "gem";
    };
    version = "3.1.1";
  };
  rake = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17850wcwkgi30p7yqh60960ypn7yibacjjha0av78zaxwvd3ijs6";
      type = "gem";
    };
    version = "13.2.1";
  };
  rdf = {
    dependencies = ["bcp47_spec" "link_header"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0l515w395kbyz4n7lx102x1nv9yl6l72gvk67p35z4cqa74s59nx";
      type = "gem";
    };
    version = "3.3.1";
  };
  rdf-normalize = {
    dependencies = ["rdf"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1glyhg7lmzbq1w7bvvf84g7kvqxcn0mw3gsh1f8w4qfvvnbl8dwj";
      type = "gem";
    };
    version = "0.7.0";
  };
  rdoc = {
    dependencies = ["psych"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ib3cnf4yllvw070gr4bz94sbmqx3haqc5f846fsvdcs494vgxrr";
      type = "gem";
    };
    version = "6.6.3.1";
  };
  redcarpet = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1sg9sbf9pm91l7lac7fs4silabyn0vflxwaa2x3lrzsm0ff8ilca";
      type = "gem";
    };
    version = "3.6.0";
  };
  redis = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fikjg6j12ka6hh36dxzhfkpqqmilzjfzcdf59iwkzsgd63f0ziq";
      type = "gem";
    };
    version = "4.8.1";
  };
  redis-namespace = {
    dependencies = ["redis"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0f92i9cwlp6xj6fyn7qn4qsaqvxfw4wqvayll7gbd26qnai1l6p9";
      type = "gem";
    };
    version = "1.11.0";
  };
  redlock = {
    dependencies = ["redis"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xvjwfzq7rqj4k311kidwmv5app3i7glz4miys6ixqy6c8yylz3c";
      type = "gem";
    };
    version = "1.3.2";
  };
  regexp_parser = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ndxm0xnv27p4gv6xynk6q41irckj76q1jsqpysd9h6f86hhp841";
      type = "gem";
    };
    version = "2.9.0";
  };
  reline = {
    dependencies = ["io-console"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gjpvnd0krf50qb928wijni2d8n04bwnm5szjsragnjv86d8iyhc";
      type = "gem";
    };
    version = "0.5.6";
  };
  request_store = {
    dependencies = ["rack"];
    groups = ["default" "production"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0kd4w7aa0sbk59b19s39pwhd636r7fjamrqalixsw5d53hs4sb1d";
      type = "gem";
    };
    version = "1.6.0";
  };
  responders = {
    dependencies = ["actionpack" "railties"];
    groups = ["default" "pam_authentication"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06ilkbbwvc8d0vppf8ywn1f79ypyymlb9krrhqv4g0q215zaiwlj";
      type = "gem";
    };
    version = "3.1.1";
  };
  rexml = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05i8518ay14kjbma550mv0jm8a6di8yp5phzrd8rj44z9qnrlrp0";
      type = "gem";
    };
    version = "3.2.6";
  };
  rotp = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0m48hv6wpmmm6cjr6q92q78h1i610riml19k5h1dil2yws3h1m3m";
      type = "gem";
    };
    version = "6.3.0";
  };
  rouge = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zd1pdldi6h8x27dqim7cy8m69xr01aw5c8k1zhkz497n4np6wgk";
      type = "gem";
    };
    version = "4.2.1";
  };
  rpam2 = {
    groups = ["default" "pam_authentication"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zvli3s4z1hf2l7gyfickm5i3afjrnycc3ihbiax6ji6arpbyf33";
      type = "gem";
    };
    version = "4.0.2";
  };
  rqrcode = {
    dependencies = ["chunky_png" "rqrcode_core"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hggzz8i1l62pkkiybhiqv6ypxw7q844sddrrbbfczjcnj5sivi3";
      type = "gem";
    };
    version = "2.2.0";
  };
  rqrcode_core = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06ld6386hbdhy5h0k09axmgn424kavpc8f27k1vjhknjhbf8jjfg";
      type = "gem";
    };
    version = "1.2.0";
  };
  rspec-core = {
    dependencies = ["rspec-support"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0k252n7s80bvjvpskgfm285a3djjjqyjcarlh3aq7a4dx2s94xsm";
      type = "gem";
    };
    version = "3.13.0";
  };
  rspec-expectations = {
    dependencies = ["diff-lcs" "rspec-support"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bhhjzwdk96vf3gq3rs7mln80q27fhq82hda3r15byb24b34h7b2";
      type = "gem";
    };
    version = "3.13.0";
  };
  rspec-github = {
    dependencies = ["rspec-core"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0kqjmd85v2fpb06d0rx43dc51f0igc1gmm8y3nz0wvmy7zg02njm";
      type = "gem";
    };
    version = "2.4.0";
  };
  rspec-mocks = {
    dependencies = ["diff-lcs" "rspec-support"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rkzkcfk2x0qjr5fxw6ib4wpjy0hqbziywplnp6pg3bm2l98jnkk";
      type = "gem";
    };
    version = "3.13.0";
  };
  rspec-rails = {
    dependencies = ["actionpack" "activesupport" "railties" "rspec-core" "rspec-expectations" "rspec-mocks" "rspec-support"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02wr7fl189p1lnpaylz48dlp1n5y763w92gk59s0345hwfr4m1q2";
      type = "gem";
    };
    version = "6.1.2";
  };
  rspec-sidekiq = {
    dependencies = ["rspec-core" "rspec-expectations" "rspec-mocks" "sidekiq"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fa24jhdv9x0kszvn8a394irhjnqhryafws6m1qv9ax2wja5nqny";
      type = "gem";
    };
    version = "4.2.0";
  };
  rspec-support = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "03z7gpqz5xkw9rf53835pa8a9vgj4lic54rnix9vfwmp2m7pv1s8";
      type = "gem";
    };
    version = "3.13.1";
  };
  rubocop = {
    dependencies = ["json" "language_server-protocol" "parallel" "parser" "rainbow" "regexp_parser" "rexml" "rubocop-ast" "ruby-progressbar" "unicode-display_width"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zkdxkhvhmxap5w2rncpmrq40dw0pbz81sa1ivsr7kh0p8j0a9x3";
      type = "gem";
    };
    version = "1.63.5";
  };
  rubocop-ast = {
    dependencies = ["parser"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "063qgvqbyv354icl2sgx758z22wzq38hd9skc3n96sbpv0cdc1qv";
      type = "gem";
    };
    version = "1.31.3";
  };
  rubocop-capybara = {
    dependencies = ["rubocop"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0f5r9di123hc4x2h453a143986plfzz9935bwc7267wj8awl8s1a";
      type = "gem";
    };
    version = "2.20.0";
  };
  rubocop-factory_bot = {
    dependencies = ["rubocop"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0d012phc7z5h1j1d2aisnbkmqlb95sld5jriia5qg2gpgbg1nxb2";
      type = "gem";
    };
    version = "2.25.1";
  };
  rubocop-performance = {
    dependencies = ["rubocop" "rubocop-ast"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16jayzjaaglhx69s6b83acpdzcxxccfkcn69gfpkimf2j64zlm7c";
      type = "gem";
    };
    version = "1.21.0";
  };
  rubocop-rails = {
    dependencies = ["activesupport" "rack" "rubocop" "rubocop-ast"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06dcxrr71sn0kkw8fwh0w884zbig2ilxpkl66s7lcis9jmkggv83";
      type = "gem";
    };
    version = "2.24.1";
  };
  rubocop-rspec = {
    dependencies = ["rubocop" "rubocop-capybara" "rubocop-factory_bot" "rubocop-rspec_rails"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1708bhr7qwic93bsnshaidnjwn3rb7kp8wcjfky5a2s84yqyb97a";
      type = "gem";
    };
    version = "2.29.2";
  };
  rubocop-rspec_rails = {
    dependencies = ["rubocop"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0618lfncmvnvkwa1jb0kga1f2yiiw1809flkj4kg52nagh3z4scp";
      type = "gem";
    };
    version = "2.28.3";
  };
  ruby-prof = {
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hnalxnvli6248g34n0bj8p3v35vpabak34qjg778bbaavbqg5h5";
      type = "gem";
    };
    version = "1.7.0";
  };
  ruby-progressbar = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cwvyb7j47m7wihpfaq7rc47zwwx9k4v7iqd9s1xch5nm53rrz40";
      type = "gem";
    };
    version = "1.13.0";
  };
  ruby-saml = {
    dependencies = ["nokogiri" "rexml"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qbhnmz1xn1ylvpywb8fyh00y6d73vjn97cs6a1ivriqpizkmkwx";
      type = "gem";
    };
    version = "1.16.0";
  };
  ruby2_keywords = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vz322p8n39hz3b4a9gkmz9y7a5jaz41zrm2ywf31dvkqm03glgz";
      type = "gem";
    };
    version = "0.0.5";
  };
  rubyzip = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0grps9197qyxakbpw02pda59v45lfgbgiyw48i0mq9f2bn9y6mrz";
      type = "gem";
    };
    version = "2.3.2";
  };
  rufus-scheduler = {
    dependencies = ["fugit"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14lr8c2sswn0sisvrfi4448pmr34za279k3zlxgh581rl1y0gjjz";
      type = "gem";
    };
    version = "3.9.1";
  };
  safety_net_attestation = {
    dependencies = ["jwt"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1khq0y5w7lf2b9a220298hphf3pakd216jc9a4x4a9pdwxs2vgln";
      type = "gem";
    };
    version = "0.4.0";
  };
  sanitize = {
    dependencies = ["crass" "nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wsw05y0h1ln3x2kvcw26fs9ivryb4xbjrb4hsk2pishkhydkz4j";
      type = "gem";
    };
    version = "6.1.0";
  };
  scenic = {
    dependencies = ["activerecord" "railties"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0w0dafg0gz3snm30247wwai0cy3j235ynwx2karyh05ayfqhm4ii";
      type = "gem";
    };
    version = "1.8.0";
  };
  selenium-webdriver = {
    dependencies = ["base64" "rexml" "rubyzip" "websocket"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1b5277ypgzjrhqgsm3c8954md0ffj116gnl921k6vldy8l6s032n";
      type = "gem";
    };
    version = "4.20.1";
  };
  semantic_range = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dlp97vg95plrsaaqj7x8l7z9vsjbhnqk4rw1l30gy26lmxpfrih";
      type = "gem";
    };
    version = "3.0.0";
  };
  sidekiq = {
    dependencies = ["connection_pool" "rack" "redis"];
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0zqr9is8y7mg5dfs1q8w5jl9spwvqkhbi9r6np8208n40hi3pydl";
      type = "gem";
    };
    version = "6.5.12";
  };
  sidekiq-bulk = {
    dependencies = ["sidekiq"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08nyxzmgf742irafy3l4fj09d4s5pyvsh0dzlh8y4hl51rgkh4xv";
      type = "gem";
    };
    version = "0.2.0";
  };
  sidekiq-scheduler = {
    dependencies = ["rufus-scheduler" "sidekiq" "tilt"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0p5jjs3x2pa2fy494xs39xbq642pri13809dcr1l3hjsm56qvp1h";
      type = "gem";
    };
    version = "5.0.3";
  };
  sidekiq-unique-jobs = {
    dependencies = ["brpoplpush-redis_script" "concurrent-ruby" "redis" "sidekiq" "thor"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1am17wfx023z1x9sxq90cyjarcmcwb95mi456mcf13m783r4n190";
      type = "gem";
    };
    version = "7.1.33";
  };
  simple-navigation = {
    dependencies = ["activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1wc1rapwhqymcjfxmlgam4cvbyhnzfxada2damq88ij2p77pjz4q";
      type = "gem";
    };
    version = "4.4.0";
  };
  simple_form = {
    dependencies = ["actionpack" "activemodel"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0070d1dvj3m908p45macjxmi8n92cwdgkwkd1jbcml6ynlp4p2v2";
      type = "gem";
    };
    version = "5.3.0";
  };
  simplecov = {
    dependencies = ["docile" "simplecov-html" "simplecov_json_formatter"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "198kcbrjxhhzca19yrdcd6jjj9sb51aaic3b0sc3pwjghg3j49py";
      type = "gem";
    };
    version = "0.22.0";
  };
  simplecov-html = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0yx01bxa8pbf9ip4hagqkp5m0mqfnwnw2xk8kjraiywz4lrss6jb";
      type = "gem";
    };
    version = "0.12.3";
  };
  simplecov-lcov = {
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1h8kswnshgb9zidvc88f4zjy4gflgz3854sx9wrw8ppgnwfg6581";
      type = "gem";
    };
    version = "0.8.0";
  };
  simplecov_json_formatter = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0a5l0733hj7sk51j81ykfmlk2vd5vaijlq9d5fn165yyx3xii52j";
      type = "gem";
    };
    version = "0.1.4";
  };
  stackprof = {
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gdqqwnampxmc54nf6zfy9apkmkpdavzipvfssmjlhnrrjy8qh7f";
      type = "gem";
    };
    version = "0.2.26";
  };
  statsd-ruby = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "028136c463nbravckxb1qi5c5nnv9r6vh2cyhiry423lac4xz79n";
      type = "gem";
    };
    version = "1.5.0";
  };
  stoplight = {
    dependencies = ["redlock"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qq3z6mwbgj1q3b9hpxxi98i63jpqycbv13fqb8362ngk7cv06x8";
      type = "gem";
    };
    version = "4.1.0";
  };
  stringio = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "063psvsn1aq6digpznxfranhcpmi0sdv2jhra5g0459sw0x2dxn1";
      type = "gem";
    };
    version = "3.1.0";
  };
  strong_migrations = {
    dependencies = ["activerecord"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0p9g8jqcakpwmbs6f77ydmbiwbgx9c5nr6jgwxh4xx6xpig1bphq";
      type = "gem";
    };
    version = "1.8.0";
  };
  swd = {
    dependencies = ["activesupport" "attr_required" "httpclient"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12b3q2sw42nnilfb51nlqdv07f31vdv2j595kd99asnkw4cjlf5w";
      type = "gem";
    };
    version = "1.3.0";
  };
  sysexits = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qjng6pllznmprzx8vb0zg0c86hdrkyjs615q41s9fjpmv2430jr";
      type = "gem";
    };
    version = "1.2.0";
  };
  temple = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fwia5hvc1xz9w7vprzjnsym3v9j5l9ggdvy70jixbvpcpz4acfz";
      type = "gem";
    };
    version = "0.10.3";
  };
  terminal-table = {
    dependencies = ["unicode-display_width"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "14dfmfjppmng5hwj7c5ka6qdapawm3h6k9lhn8zj001ybypvclgr";
      type = "gem";
    };
    version = "3.0.2";
  };
  terrapin = {
    dependencies = ["climate_control"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0k968xzamd4y92zflrdilvc7wp8cj49n9lz34vnm95rg1j2gbqnx";
      type = "gem";
    };
    version = "1.0.1";
  };
  test-prof = {
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rwnq67qm2ngz066sncvg0dv65bsk29qz3xarbv8qan2hi7yw0qg";
      type = "gem";
    };
    version = "1.3.3";
  };
  thor = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vq1fjp45az9hfp6fxljhdrkv75cvbab1jfrwcw738pnsiqk8zps";
      type = "gem";
    };
    version = "1.3.1";
  };
  tilt = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0p3l7v619hwfi781l3r7ypyv1l8hivp09r18kmkn6g11c4yr1pc2";
      type = "gem";
    };
    version = "2.3.0";
  };
  timeout = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16mvvsmx90023wrhf8dxc1lpqh0m8alk65shb7xcya6a9gflw7vg";
      type = "gem";
    };
    version = "0.4.1";
  };
  tpm-key_attestation = {
    dependencies = ["bindata" "openssl" "openssl-signature_algorithm"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0v8y5dibsyskv1ncdgszhxwzq0gzmvb0zl7sgmx0xvsgy86dhcz1";
      type = "gem";
    };
    version = "0.12.0";
  };
  tty-color = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0aik4kmhwwrmkysha7qibi2nyzb4c8kp42bd5vxnf8sf7b53g73g";
      type = "gem";
    };
    version = "0.6.0";
  };
  tty-cursor = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0j5zw041jgkmn605ya1zc151bxgxl6v192v2i26qhxx7ws2l2lvr";
      type = "gem";
    };
    version = "0.7.1";
  };
  tty-prompt = {
    dependencies = ["pastel" "tty-reader"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1j4y8ik82azjxshgd4i1v4wwhsv3g9cngpygxqkkz69qaa8cxnzw";
      type = "gem";
    };
    version = "0.23.1";
  };
  tty-reader = {
    dependencies = ["tty-cursor" "tty-screen" "wisper"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1cf2k7w7d84hshg4kzrjvk9pkyc2g1m3nx2n1rpmdcf0hp4p4af6";
      type = "gem";
    };
    version = "0.9.0";
  };
  tty-screen = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0l4vh6g333jxm9lakilkva2gn17j6gb052626r1pdbmy2lhnb460";
      type = "gem";
    };
    version = "0.8.2";
  };
  twitter-text = {
    dependencies = ["idn-ruby" "unf"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dnmp0bj3l01nbb52zby2c7hrazcdwfg846knkrjdfl0yfmv793z";
      type = "gem";
    };
    version = "3.1.0";
  };
  tzinfo = {
    dependencies = ["concurrent-ruby"];
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "16w2g84dzaf3z13gxyzlzbf748kylk5bdgg3n1ipvkvvqy685bwd";
      type = "gem";
    };
    version = "2.0.6";
  };
  tzinfo-data = {
    dependencies = ["tzinfo"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1rg1dmx6mknjazb8qq0j9sb9fah470my5sbjb6f3pa6si5018682";
      type = "gem";
    };
    version = "1.2024.1";
  };
  unf = {
    dependencies = ["unf_ext"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bh2cf73i2ffh4fcpdn9ir4mhq8zi50ik0zqa1braahzadx536a9";
      type = "gem";
    };
    version = "0.1.4";
  };
  unf_ext = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1sf6bxvf6x8gihv6j63iakixmdddgls58cpxpg32chckb2l18qcj";
      type = "gem";
    };
    version = "0.0.9.1";
  };
  unicode-display_width = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d0azx233nags5jx3fqyr23qa2rhgzbhv8pxp46dgbg1mpf82xky";
      type = "gem";
    };
    version = "2.5.0";
  };
  uri = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "094gk72ckazf495qc76gk09b5i318d5l9m7bicg2wxlrjcm3qm96";
      type = "gem";
    };
    version = "0.13.0";
  };
  validate_email = {
    dependencies = ["activemodel" "mail"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1r1fz29l699arka177c9xw7409d1a3ff95bf7a6pmc97slb91zlx";
      type = "gem";
    };
    version = "0.1.6";
  };
  validate_url = {
    dependencies = ["activemodel" "public_suffix"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0lblym140w5n88ijyfgcvkxvpfj8m6z00rxxf2ckmmhk0x61dzkj";
      type = "gem";
    };
    version = "1.0.15";
  };
  warden = {
    dependencies = ["rack"];
    groups = ["default" "pam_authentication"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1l7gl7vms023w4clg02pm4ky9j12la2vzsixi2xrv9imbn44ys26";
      type = "gem";
    };
    version = "1.2.9";
  };
  webauthn = {
    dependencies = ["android_key_attestation" "awrence" "bindata" "cbor" "cose" "openssl" "safety_net_attestation" "tpm-key_attestation"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dwh2xrpwhbzyncb1wvgzz8fmln3r15iqz53c48q4swagpqzqig5";
      type = "gem";
    };
    version = "3.1.0";
  };
  webfinger = {
    dependencies = ["activesupport" "httpclient"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "18jj50b44a471ig7hw1ax90wxaaz40acmrf6cm7m2iyshlffy53q";
      type = "gem";
    };
    version = "1.2.0";
  };
  webmock = {
    dependencies = ["addressable" "crack" "hashdiff"];
    groups = ["test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "07zk8ljq5kyd1mm9qw3452fcnf7frg3irh9ql8ln2m8zbi1qf1qh";
      type = "gem";
    };
    version = "3.23.0";
  };
  webpacker = {
    dependencies = ["activesupport" "rack-proxy" "railties" "semantic_range"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0fh4vijqiq1h7w28llk67y9csc0m4wkdivrsl4fsxg279v6j5z3i";
      type = "gem";
    };
    version = "5.4.4";
  };
  webpush = {
    dependencies = ["hkdf" "jwt"];
    groups = ["default"];
    platforms = [];
    source = {
      fetchSubmodules = false;
      rev = "f14a4d52e201128b1b00245d11b6de80d6cfdcd9";
      sha256 = "1gz34809xwyaqprxmjdyvzsxc63rdnmxn8w44iqkhpi3dzmkacmp";
      type = "git";
      url = "https://github.com/ClearlyClaire/webpush.git";
    };
    version = "0.3.8";
  };
  webrick = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13qm7s0gr2pmfcl7dxrmq38asaza4w0i2n9my4yzs499j731wh8r";
      type = "gem";
    };
    version = "1.8.1";
  };
  websocket = {
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1a4zc8d0d91c3xqwapda3j3zgpfwdbj76hkb69xn6qvfkfks9h9c";
      type = "gem";
    };
    version = "1.2.10";
  };
  websocket-driver = {
    dependencies = ["websocket-extensions"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nyh873w4lvahcl8kzbjfca26656d5c6z3md4sbqg5y1gfz0157n";
      type = "gem";
    };
    version = "0.7.6";
  };
  websocket-extensions = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hc2g9qps8lmhibl5baa91b4qx8wqw872rgwagml78ydj8qacsqw";
      type = "gem";
    };
    version = "0.1.5";
  };
  wisper = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1rpsi0ziy78cj82sbyyywby4d0aw0a5q84v65qd28vqn79fbq5yf";
      type = "gem";
    };
    version = "2.0.1";
  };
  xorcist = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dbbiy8xlcfvn9ais37xfb5rci4liwakkmxzbkp72wmvlgcrf339";
      type = "gem";
    };
    version = "1.1.3";
  };
  xpath = {
    dependencies = ["nokogiri"];
    groups = ["default" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bh8lk9hvlpn7vmi6h4hkcwjzvs2y0cmkk3yjjdr8fxvj6fsgzbd";
      type = "gem";
    };
    version = "3.2.0";
  };
  zeitwerk = {
    groups = ["default" "development" "pam_authentication" "production" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1m67qmsak3x8ixs8rb971azl3l7wapri65pmbf5z886h46q63f1d";
      type = "gem";
    };
    version = "2.6.13";
  };
}

