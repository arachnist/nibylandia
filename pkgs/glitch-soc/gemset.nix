{
  actioncable = {
    dependencies =
      [ "actionpack" "activesupport" "nio4r" "websocket-driver" "zeitwerk" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0jxrijf13rs7mnmfjy1ag36slxkf586sjzjwnb01hwr04dqfhmak";
      type = "gem";
    };
    version = "7.2.2";
  };
  actionmailbox = {
    dependencies = [
      "actionpack"
      "activejob"
      "activerecord"
      "activestorage"
      "activesupport"
      "mail"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1mm5zb627xc7b1rplffpcnf6i3hb6jqv92i7317lm1ap9xhkgpwi";
      type = "gem";
    };
    version = "7.2.2";
  };
  actionmailer = {
    dependencies = [
      "actionpack"
      "actionview"
      "activejob"
      "activesupport"
      "mail"
      "rails-dom-testing"
    ];
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0qfr654g1bv80vl37h2dssmdn6dxpvn53lp3h3skzd2zxi80xzhw";
      type = "gem";
    };
    version = "7.2.2";
  };
  actionpack = {
    dependencies = [
      "actionview"
      "activesupport"
      "nokogiri"
      "racc"
      "rack"
      "rack-session"
      "rack-test"
      "rails-dom-testing"
      "rails-html-sanitizer"
      "useragent"
    ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "15cjwnxjc8n8jg25r6gzil6pjy47v5nz0j15xg9sq5r97rgrcj69";
      type = "gem";
    };
    version = "7.2.2";
  };
  actiontext = {
    dependencies = [
      "actionpack"
      "activerecord"
      "activestorage"
      "activesupport"
      "globalid"
      "nokogiri"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1igchfv1cr1ca70cxkh9j5s6li3zckmj19a8xmp2psh1fns5m36m";
      type = "gem";
    };
    version = "7.2.2";
  };
  actionview = {
    dependencies = [
      "activesupport"
      "builder"
      "erubi"
      "rails-dom-testing"
      "rails-html-sanitizer"
    ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0xhpymhydk81rn9gnxcrbvm9if1dca3lw9g1gf0sa4g2s3rs2pg9";
      type = "gem";
    };
    version = "7.2.2";
  };
  active_model_serializers = {
    dependencies =
      [ "actionpack" "activemodel" "case_transform" "jsonapi-renderer" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0k0cig5ic38vfd7iba3rv3h7hs2lmycqp0wx4w286kmbhch5n9q8";
      type = "gem";
    };
    version = "0.10.15";
  };
  activejob = {
    dependencies = [ "activesupport" "globalid" ];
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "051axpdv6x1ms87wxk95mm27sf5bsl9as9bm70ic2fx3crhmykkh";
      type = "gem";
    };
    version = "7.2.2";
  };
  activemodel = {
    dependencies = [ "activesupport" ];
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "172kxri267j1wfsgx0lpzkhpkh1nsxx0c54qv721arnrhmjz1s26";
      type = "gem";
    };
    version = "7.2.2";
  };
  activerecord = {
    dependencies = [ "activemodel" "activesupport" "timeout" ];
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1sqs0wnlq4w8pbly4qmpm8mgqp857izw5mmlfw63l29k9d158n8k";
      type = "gem";
    };
    version = "7.2.2";
  };
  activestorage = {
    dependencies =
      [ "actionpack" "activejob" "activerecord" "activesupport" "marcel" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "03k39gllv4almdl1scly8n9lcz5i4kialp512mjmhx58hwnicj14";
      type = "gem";
    };
    version = "7.2.2";
  };
  activesupport = {
    dependencies = [
      "base64"
      "benchmark"
      "bigdecimal"
      "concurrent-ruby"
      "connection_pool"
      "drb"
      "i18n"
      "logger"
      "minitest"
      "securerandom"
      "tzinfo"
    ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "12ijz1mmg70agw4d91hjdyzvma3dzs52mchasslxyn7p9j960qs3";
      type = "gem";
    };
    version = "7.2.2";
  };
  addressable = {
    dependencies = [ "public_suffix" ];
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0cl2qpvwiffym62z991ynks7imsm87qmgxf0yfsmlwzkgi9qcaa6";
      type = "gem";
    };
    version = "2.8.7";
  };
  aes_key_wrap = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "19bn0y70qm6mfj4y1m0j3s8ggh6dvxwrwrj5vfamhdrpddsz8ddr";
      type = "gem";
    };
    version = "1.1.0";
  };
  android_key_attestation = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "02spc1sh7zsljl02v9d5rdb717b628vw2k7jkkplifyjk4db0zj6";
      type = "gem";
    };
    version = "0.3.0";
  };
  annotaterb = {
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1w9gdd5cqygm0ppsfxpv3szlw4yh8zg34havcqssgvrg0092jivg";
      type = "gem";
    };
    version = "4.13.0";
  };
  ast = {
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "04nc8x27hlzlrr5c2gn7mar4vdr0apw5xg22wp6m8dx3wqr04a0y";
      type = "gem";
    };
    version = "2.4.2";
  };
  attr_required = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "16fbwr6nmsn97n0a6k1nwbpyz08zpinhd6g7196lz1syndbgrszh";
      type = "gem";
    };
    version = "1.0.2";
  };
  aws-eventstream = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0gvdg4yx4p9av2glmp7vsxhs0n8fj1ga9kq2xdb8f95j7b04qhzi";
      type = "gem";
    };
    version = "1.3.0";
  };
  aws-partitions = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0x1c9x2mfhwg7dyfnxii0jja6qc7n4h8rhjravibryy79h6zqiqs";
      type = "gem";
    };
    version = "1.1015.0";
  };
  aws-sdk-core = {
    dependencies =
      [ "aws-eventstream" "aws-partitions" "aws-sigv4" "jmespath" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "12s8v199kb3vixl2896axfj4ifkglr0q7zyn73pdkdf3kpra1wi4";
      type = "gem";
    };
    version = "3.214.0";
  };
  aws-sdk-kms = {
    dependencies = [ "aws-sdk-core" "aws-sigv4" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0xd3ddd9jiapkgv8im4pl9dcdy2ps7qjsssf2nz3q6sd1ca8x0di";
      type = "gem";
    };
    version = "1.96.0";
  };
  aws-sdk-s3 = {
    dependencies = [ "aws-sdk-core" "aws-sdk-kms" "aws-sigv4" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1hl2lhi7phyib5982vprvmfw9hyhwx4djiw460idd7c7v16knzkv";
      type = "gem";
    };
    version = "1.175.0";
  };
  aws-sigv4 = {
    dependencies = [ "aws-eventstream" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1fq3lbvkgm1vk5wa8l7vdnq3vjnlmsnyf4bbd0jq3qadyd9hf54a";
      type = "gem";
    };
    version = "1.10.1";
  };
  azure-blob = {
    dependencies = [ "rexml" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0n8jvkdpxf3h2jz7yggdlppq6yb4zgqicm0xfvl74a5q1sj05daj";
      type = "gem";
    };
    version = "0.5.3";
  };
  base64 = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "01qml0yilb9basf7is2614skjp8384h2pycfx86cr8023arfj98g";
      type = "gem";
    };
    version = "0.2.0";
  };
  bcp47_spec = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "043qld01c163yc7fxlar3046dac2833rlcg44jbbs9n1jvgjxmiz";
      type = "gem";
    };
    version = "0.2.1";
  };
  bcrypt = {
    groups = [ "default" "pam_authentication" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "16a0g2q40biv93i1hch3gw8rbmhp77qnnifj1k0a6m7dng3zh444";
      type = "gem";
    };
    version = "3.1.20";
  };
  benchmark = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0jl71qcgamm96dzyqk695j24qszhcc7liw74qc83fpjljp2gh4hg";
      type = "gem";
    };
    version = "0.4.0";
  };
  better_errors = {
    dependencies = [ "erubi" "rack" "rouge" ];
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0wqazisnn6hn1wsza412xribpw5wzx6b5z5p4mcpfgizr6xg367p";
      type = "gem";
    };
    version = "2.10.1";
  };
  bigdecimal = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1gi7zqgmqwi5lizggs1jhc3zlwaqayy9rx2ah80sxy24bbnng558";
      type = "gem";
    };
    version = "3.1.8";
  };
  bindata = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "08r67nglsqnxrbn803szf5bdnqhchhq8kf2by94f37fcl65wpp19";
      type = "gem";
    };
    version = "2.5.0";
  };
  binding_of_caller = {
    dependencies = [ "debug_inspector" ];
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "16mjj15ks5ws53v2y31hxcmf46d0qjdvdaadpk7xsij2zymh4a9b";
      type = "gem";
    };
    version = "1.0.1";
  };
  blurhash = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1wni86h2mlb7sj51nq3iwsvkrzlaggls9xlf4p9dzr1ns79dphca";
      type = "gem";
    };
    version = "0.1.8";
  };
  bootsnap = {
    dependencies = [ "msgpack" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0mdgj9yw1hmx3xh2qxyjc31y8igmxzd9h0c245ay2zkz76pl4k5c";
      type = "gem";
    };
    version = "1.18.4";
  };
  brakeman = {
    dependencies = [ "racc" ];
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "067nggymy626w9v5baza4dfk9jcykb8z8pr244dlakczd59xc0nm";
      type = "gem";
    };
    version = "6.2.2";
  };
  browser = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1ir4ahq8jg55rqaw727b44wv49gai4i7yy5d8f1fq02816flw45r";
      type = "gem";
    };
    version = "6.1.0";
  };
  brpoplpush-redis_script = {
    dependencies = [ "concurrent-ruby" "redis" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1nd5zj5yqmhv9lrsqz8s2dqq28v4ywy95qrw7nzhhf89dl4dq49l";
      type = "gem";
    };
    version = "0.1.3";
  };
  builder = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0pw3r2lyagsxkm71bf44v5b74f7l9r7di22brbyji9fwz791hya9";
      type = "gem";
    };
    version = "3.3.0";
  };
  bundler-audit = {
    dependencies = [ "thor" ];
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0j0h5cgnzk0ms17ssjkzfzwz65ggrs3lsp53a1j46p4616m1s1bk";
      type = "gem";
    };
    version = "0.9.2";
  };
  capybara = {
    dependencies = [
      "addressable"
      "matrix"
      "mini_mime"
      "nokogiri"
      "rack"
      "rack-test"
      "regexp_parser"
      "xpath"
    ];
    groups = [ "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1vxfah83j6zpw3v5hic0j70h519nvmix2hbszmjwm8cfawhagns2";
      type = "gem";
    };
    version = "3.40.0";
  };
  case_transform = {
    dependencies = [ "activesupport" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0fzyws6spn5arqf6q604dh9mrj84a36k5hsc8z7jgcpfvhc49bg2";
      type = "gem";
    };
    version = "0.2";
  };
  cbor = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1dsf9gjc2cj79vrnz2vgq573biqjw7ad4b0idm05xg6rb3y9gq4y";
      type = "gem";
    };
    version = "0.5.9.8";
  };
  charlock_holmes = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1c1dws56r7p8y363dhyikg7205z59a3bn4amnv2y488rrq8qm7ml";
      type = "gem";
    };
    version = "0.7.9";
  };
  chewy = {
    dependencies = [ "activesupport" "elasticsearch" "elasticsearch-dsl" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0kgqj7hcs09ln7i1rds1xify08rzjk02ryzvjdvnllg1fkh3vm2b";
      type = "gem";
    };
    version = "7.6.0";
  };
  childprocess = {
    dependencies = [ "logger" ];
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1v5nalaarxnfdm6rxb7q6fmc6nx097jd630ax6h9ch7xw95li3cs";
      type = "gem";
    };
    version = "5.1.0";
  };
  chunky_png = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1znw5x86hmm9vfhidwdsijz8m38pqgmv98l9ryilvky0aldv7mc9";
      type = "gem";
    };
    version = "1.4.0";
  };
  climate_control = {
    groups = [ "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "198aswdyqlvcw9jkd95b7b8dp3fg0wx89kd1dx9wia1z36b1icin";
      type = "gem";
    };
    version = "1.2.0";
  };
  cocoon = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "038z97pkhvsqbh6cmyyzj58ya968p24k7r0f0rx7sa2kjvk193yh";
      type = "gem";
    };
    version = "1.2.15";
  };
  color_diff = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "01dpvqlzybpb3pkcwd9ik5sbjw283618ywvdphxslhiy8ps3kp4r";
      type = "gem";
    };
    version = "0.1";
  };
  concurrent-ruby = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0chwfdq2a6kbj6xz9l6zrdfnyghnh32si82la1dnpa5h75ir5anl";
      type = "gem";
    };
    version = "1.3.4";
  };
  connection_pool = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1x32mcpm2cl5492kd6lbjbaf17qsssmpx9kdyr7z1wcif2cwyh0g";
      type = "gem";
    };
    version = "2.4.1";
  };
  cose = {
    dependencies = [ "cbor" "openssl-signature_algorithm" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1rbdzl9n8ppyp38y75hw06s17kp922ybj6jfvhz52p83dg6xpm6m";
      type = "gem";
    };
    version = "1.3.1";
  };
  crack = {
    dependencies = [ "bigdecimal" "rexml" ];
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0jaa7is4fw1cxigm8vlyhg05bw4nqy4f91zjqxk7pp4c8bdyyfn8";
      type = "gem";
    };
    version = "1.0.0";
  };
  crass = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0pfl5c0pyqaparxaqxi6s4gfl21bdldwiawrc0aknyvflli60lfw";
      type = "gem";
    };
    version = "1.0.6";
  };
  css_parser = {
    dependencies = [ "addressable" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "17i0fn99kswvfps8r698zw2cr16rc98xdrl0d26y36rv3vhdqh0r";
      type = "gem";
    };
    version = "1.19.1";
  };
  csv = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0zfn40dvgjk1xv1z8l11hr9jfg3jncwsc9yhzsz4l4rivkpivg8b";
      type = "gem";
    };
    version = "3.3.0";
  };
  database_cleaner-active_record = {
    dependencies = [ "activerecord" "database_cleaner-core" ];
    groups = [ "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1iz1hv2b1z7509dxvxdwzay1hhs24glxls5ldbyh688zxkcdca1j";
      type = "gem";
    };
    version = "2.2.0";
  };
  database_cleaner-core = {
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0v44bn386ipjjh4m2kl53dal8g4d41xajn2jggnmjbhn6965fil6";
      type = "gem";
    };
    version = "2.0.1";
  };
  date = {
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "04d7l3xdmkybrd20gayf8s38pgfld0hf8m726lz9np32xnnsszrf";
      type = "gem";
    };
    version = "3.4.0";
  };
  debug = {
    dependencies = [ "irb" "reline" ];
    groups = [ "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1z77qyzcmvz3ciny6cb24s79a243jqkybqk30b310yichp02dq28";
      type = "gem";
    };
    version = "1.9.2";
  };
  debug_inspector = {
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "18k8x9viqlkh7dbmjzh8crbjy8w480arpa766cw1dnn3xcpa1pwv";
      type = "gem";
    };
    version = "1.2.0";
  };
  devise = {
    dependencies = [ "bcrypt" "orm_adapter" "railties" "responders" "warden" ];
    groups = [ "default" "pam_authentication" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1y57fpcvy1kjd4nb7zk7mvzq62wqcpfynrgblj558k3hbvz4404j";
      type = "gem";
    };
    version = "4.9.4";
  };
  devise-two-factor = {
    dependencies = [ "activesupport" "devise" "railties" "rotp" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "041c6zrwm3za1scr07kdgmnlxj7lnrr1jcb832grkavf1sh9wf4h";
      type = "gem";
    };
    version = "6.1.0";
  };
  devise_pam_authenticatable2 = {
    dependencies = [ "devise" "rpam2" ];
    groups = [ "pam_authentication" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "13ipl52pkhc6vxp8ca31viwv01237bi2bfk3b1fixq1x46nf87p2";
      type = "gem";
    };
    version = "9.2.0";
  };
  diff-lcs = {
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1znxccz83m4xgpd239nyqxlifdb7m8rlfayk6s259186nkgj6ci7";
      type = "gem";
    };
    version = "1.5.1";
  };
  discard = {
    dependencies = [ "activerecord" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1l35bpwnxqd6pqqy315a1y6bi2n8y6cd69dqh4gpi5nz7njx5z3f";
      type = "gem";
    };
    version = "1.4.0";
  };
  docile = {
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "07pj4z3h8wk4fgdn6s62vw1lwvhj0ac0x10vfbdkr9xzk7krn5cn";
      type = "gem";
    };
    version = "1.4.1";
  };
  domain_name = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0cyr2xm576gqhqicsyqnhanni47408w2pgvrfi8pd13h2li3nsaz";
      type = "gem";
    };
    version = "0.6.20240107";
  };
  doorkeeper = {
    dependencies = [ "railties" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "01c179i12rwff7b8x2ydbg7da18zjhvyjhav2q7198zaw1z79g2s";
      type = "gem";
    };
    version = "5.8.0";
  };
  dotenv = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0aanng90ad6vg9sm3qlq1223k456qw2xli9kcx13a3ga33kh5ibd";
      type = "gem";
    };
    version = "3.1.4";
  };
  drb = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0h5kbj9hvg5hb3c7l425zpds0vb42phvln2knab8nmazg2zp5m79";
      type = "gem";
    };
    version = "2.2.1";
  };
  elasticsearch = {
    dependencies = [ "elasticsearch-api" "elasticsearch-transport" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "11pw5x7kg6f6m8rqy2kpbzdlnvijjpmbqkj2gz8237wkbl40y27d";
      type = "gem";
    };
    version = "7.17.11";
  };
  elasticsearch-api = {
    dependencies = [ "multi_json" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "01wi43a3zylrq2vca08vir5va142g5m3jcsak3rprjck8jvggn7y";
      type = "gem";
    };
    version = "7.17.11";
  };
  elasticsearch-dsl = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "174m3fwm3mawbkjg2xbmqvljq7ava4s95m8vpg5khcvfj506wxfk";
      type = "gem";
    };
    version = "0.1.10";
  };
  elasticsearch-transport = {
    dependencies = [ "base64" "faraday" "multi_json" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "00qgyyvjyyv7z22qjd408pby1h7902gdwkh8h3z3jk2y57amg06i";
      type = "gem";
    };
    version = "7.17.11";
  };
  email_spec = {
    dependencies = [ "htmlentities" "launchy" "mail" ];
    groups = [ "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "049dhlyy2hcksp1wj9mx2fngk5limkm3afxysnizg1hi2dxbw8yz";
      type = "gem";
    };
    version = "2.3.0";
  };
  erubi = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0qnd6ff4az22ysnmni3730c41b979xinilahzg86bn7gv93ip9pw";
      type = "gem";
    };
    version = "1.13.0";
  };
  et-orbi = {
    dependencies = [ "tzinfo" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0r6zylqjfv0xhdxvldr0kgmnglm57nm506pcm6085f0xqa68cvnj";
      type = "gem";
    };
    version = "1.2.11";
  };
  excon = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1w7098hnyby5sn2315qy26as6kxlxivxlcrs714amj9g9hxaryfs";
      type = "gem";
    };
    version = "0.112.0";
  };
  fabrication = {
    groups = [ "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1al5iv3as21l5clci0b5cg27z136pan7gkj7plp4l0w83c6z2y9c";
      type = "gem";
    };
    version = "2.31.0";
  };
  faker = {
    dependencies = [ "i18n" ];
    groups = [ "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1z4vhl6lbd0la2j0ab05sz8wq5mqvpikzhjrc142z24x4zmgpl8s";
      type = "gem";
    };
    version = "3.5.1";
  };
  faraday = {
    dependencies = [ "faraday-net_http" "json" "logger" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "05s5pyxh7y68jphb0lgrh0ksxbp4lmbsc6a6qg0ahj15pjqx01ni";
      type = "gem";
    };
    version = "2.12.0";
  };
  faraday-httpclient = {
    dependencies = [ "httpclient" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0pgwdm8py5pidl19gl42sshb9jkj89c87lw214v5xp87m25kfjic";
      type = "gem";
    };
    version = "2.0.1";
  };
  faraday-net_http = {
    dependencies = [ "net-http" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0rg54k4skaz8z7j358p6pdzc9pr84fjq7sdlpicf7s5ig7vb1rlk";
      type = "gem";
    };
    version = "3.3.0";
  };
  fast_blank = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1shpmamyzyhyxmv95r96ja5rylzaw60r19647d0fdm7y2h2c77r6";
      type = "gem";
    };
    version = "1.0.1";
  };
  fastimage = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1sfc7svf7h1ja6zmsq9f3ps6pg0q4hymphh6rk7ipmp7ygqjkii3";
      type = "gem";
    };
    version = "2.3.1";
  };
  ffi = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "07139870npj59jnl8vmk39ja3gdk3fb5z9vc0lf32y2h891hwqsi";
      type = "gem";
    };
    version = "1.17.0";
  };
  ffi-compiler = {
    dependencies = [ "ffi" "rake" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1844j58cdg2q6g0rqfwg4rrambnhf059h4yg9rfmrbrcs60kskx9";
      type = "gem";
    };
    version = "1.3.2";
  };
  flatware = {
    dependencies = [ "drb" "thor" ];
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "13wcwdpdx1asjxvqpyxwlcazzsjisls28jjn28d9cqw9zwszcm1p";
      type = "gem";
    };
    version = "2.3.3";
  };
  flatware-rspec = {
    dependencies = [ "flatware" "rspec" ];
    groups = [ "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0dgl20mi9a5iwcy6v9jq148ljy9rrvyjhp1rpd1sgadfw6kxzbhc";
      type = "gem";
    };
    version = "2.3.3";
  };
  fog-core = {
    dependencies = [ "builder" "excon" "formatador" "mime-types" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1vf21i2qpl1hagapds0qjlfl6gsyrbssifn2br2ifn3fg9j80yxl";
      type = "gem";
    };
    version = "2.5.0";
  };
  fog-json = {
    dependencies = [ "fog-core" "multi_json" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1zj8llzc119zafbmfa4ai3z5s7c4vp9akfs0f9l2piyvcarmlkyx";
      type = "gem";
    };
    version = "1.2.0";
  };
  fog-openstack = {
    dependencies = [ "fog-core" "fog-json" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1z7k3al9bb5ypzkrvi5szpfyi8sksggq68fwxrxywq6rky5lvhdq";
      type = "gem";
    };
    version = "1.1.3";
  };
  formatador = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1l06bv4avphbdmr1y4g0rqlczr38k6r65b3zghrbj2ynyhm3xqjl";
      type = "gem";
    };
    version = "1.1.0";
  };
  fugit = {
    dependencies = [ "et-orbi" "raabro" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0s4qhq3mjl0gak5wl20w9d5jhq069mk1393dkj76s8i2pvkqb578";
      type = "gem";
    };
    version = "1.11.1";
  };
  globalid = {
    dependencies = [ "activesupport" ];
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1sbw6b66r7cwdx3jhs46s4lr991969hvigkjpbdl7y3i31qpdgvh";
      type = "gem";
    };
    version = "1.2.1";
  };
  google-protobuf = {
    groups = [ "default" "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0fanhdf3vzghma51w1hqpp8s585mwzxgqkwvxj5is4q9j0pgwcs3";
      type = "gem";
    };
    version = "3.25.5";
  };
  googleapis-common-protos-types = {
    dependencies = [ "google-protobuf" ];
    groups = [ "default" "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0sqmmfdxjp3fy7hzvl35bnd0yb0ds9030np5jqh338qz4w661cap";
      type = "gem";
    };
    version = "1.15.0";
  };
  haml = {
    dependencies = [ "temple" "thor" "tilt" ];
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "15yxph91zswbnfy7szpdcfbdfqqn595ff290hm4f6fcnhryvhvlf";
      type = "gem";
    };
    version = "6.3.0";
  };
  haml-rails = {
    dependencies = [ "actionpack" "activesupport" "haml" "railties" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1sjrdwc4azzfpsp2xk0365z031482gcrs0c54d5wx0igkqca0fr7";
      type = "gem";
    };
    version = "2.1.0";
  };
  haml_lint = {
    dependencies = [ "haml" "parallel" "rainbow" "rubocop" "sysexits" ];
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1cc45znb0fiab69d0x67yakd5kywwl7w9ck128ikzqrgixa2ps12";
      type = "gem";
    };
    version = "0.59.0";
  };
  hashdiff = {
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0slky0n6n12gjgimzdbdigpwyg5wgq8fysjwkzzfw33ff8b675n7";
      type = "gem";
    };
    version = "1.1.1";
  };
  hashie = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1nh3arcrbz1rc1cr59qm53sdhqm137b258y8rcb4cvd3y98lwv4x";
      type = "gem";
    };
    version = "5.0.0";
  };
  hcaptcha = {
    dependencies = [ "json" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0fh6391zlv2ikvzqj2gymb70k1avk1j9da8bzgw0scsz2wqq98m2";
      type = "gem";
    };
    version = "7.1.0";
  };
  highline = {
    dependencies = [ "reline" ];
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1q0f7izfi542sp93gl276spm0xyws1kpqxm0alrwwmz06mz4i0ks";
      type = "gem";
    };
    version = "3.1.1";
  };
  hiredis = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "04jj8k7lxqxw24sp0jiravigdkgsyrpprxpxm71ba93x1wr2w1bz";
      type = "gem";
    };
    version = "0.6.3";
  };
  hkdf = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "04fixg0a51n4vy0j6c1hvisa2yl33m3jrrpxpb5sq6j511vjriil";
      type = "gem";
    };
    version = "0.3.0";
  };
  htmlentities = {
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1nkklqsn8ir8wizzlakncfv42i32wc0w9hxp00hvdlgjr7376nhj";
      type = "gem";
    };
    version = "4.3.4";
  };
  http = {
    dependencies =
      [ "addressable" "base64" "http-cookie" "http-form_data" "llhttp-ffi" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "05b1khh7wxga9jviy9yi8z1nckxbm3svlzv40y0zvq3nag3d77mr";
      type = "gem";
    };
    version = "5.2.0";
  };
  http-cookie = {
    dependencies = [ "domain_name" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "13rilvlv8kwbzqfb644qp6hrbsj82cbqmnzcvqip1p6vqx36sxbk";
      type = "gem";
    };
    version = "1.0.5";
  };
  http-form_data = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1wx591jdhy84901pklh1n9sgh74gnvq1qyqxwchni1yrc49ynknc";
      type = "gem";
    };
    version = "2.3.0";
  };
  http_accept_language = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0d0nlfz9vm4jr1l6q0chx4rp2hrnrfbx3gadc1dz930lbbaz0hq0";
      type = "gem";
    };
    version = "2.1.1";
  };
  httpclient = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "19mxmvghp7ki3klsxwrlwr431li7hm1lczhhj8z4qihl2acy8l99";
      type = "gem";
    };
    version = "2.8.3";
  };
  httplog = {
    dependencies = [ "rack" "rainbow" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "098n4dfmiydbm9if52h17kxglbli9gihjgzhcghv274ni2c9ab49";
      type = "gem";
    };
    version = "1.7.0";
  };
  i18n = {
    dependencies = [ "concurrent-ruby" ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0k31wcgnvcvd14snz0pfqj976zv6drfsnq6x8acz10fiyms9l8nw";
      type = "gem";
    };
    version = "1.14.6";
  };
  i18n-tasks = {
    dependencies = [
      "activesupport"
      "ast"
      "erubi"
      "highline"
      "i18n"
      "parser"
      "rails-i18n"
      "rainbow"
      "terminal-table"
    ];
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1v03380ffwwa84xzsc6dhkc57cs156qx5aij4bfdcs1j5bpxmn1s";
      type = "gem";
    };
    version = "1.0.14";
  };
  idn-ruby = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0dy04jx3n1ddz744b80mg7hp87miysnjp0h21lqr43hpmhdglxih";
      type = "gem";
    };
    version = "0.1.5";
  };
  inline_svg = {
    dependencies = [ "activesupport" "nokogiri" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "03x1z55sh7cpb63g46cbd6135jmp13idcgqzqsnzinbg4cs2jrav";
      type = "gem";
    };
    version = "1.10.0";
  };
  io-console = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "08d2lx42pa8jjav0lcjbzfzmw61b8imxr9041pva8xzqabrczp7h";
      type = "gem";
    };
    version = "0.7.2";
  };
  irb = {
    dependencies = [ "rdoc" "reline" ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1y40dv3caswr81dlsyln6vnmmpzf5jcal2rqjbsglvnkb0xh0xar";
      type = "gem";
    };
    version = "1.14.1";
  };
  jd-paperclip-azure = {
    dependencies = [ "addressable" "azure-blob" "hashie" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1gcikrlqv6r9pqvw2kfyvmia3rikp9irhq1c10njz4z7i5za4xk9";
      type = "gem";
    };
    version = "3.0.0";
  };
  jmespath = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1cdw9vw2qly7q7r41s7phnac264rbsdqgj4l0h4nqgbjb157g393";
      type = "gem";
    };
    version = "1.6.2";
  };
  json = {
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0ap2ks9yfzr9d0ig50wanws36lpkh3if5favl5pplv7gqaj8qkj0";
      type = "gem";
    };
    version = "2.8.1";
  };
  json-canonicalization = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0illsmkly0hhi24lm1l6jjjdr6jykvydkwi1cxf4ad3mra68m16l";
      type = "gem";
    };
    version = "1.0.0";
  };
  json-jwt = {
    dependencies = [ "activesupport" "aes_key_wrap" "bindata" "httpclient" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "13xhvkh2fxydcf466az172nwfykzppm3g9ckp8mafsib45w77clj";
      type = "gem";
    };
    version = "1.15.3.1";
  };
  json-ld = {
    dependencies = [
      "htmlentities"
      "json-canonicalization"
      "link_header"
      "multi_json"
      "rack"
      "rdf"
      "rexml"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "09xbw6kc95qgmqcfjp0jjw8dnfm28lw9b5lf8bdh3p2vpy9ihlxr";
      type = "gem";
    };
    version = "3.3.2";
  };
  json-ld-preloaded = {
    dependencies = [ "json-ld" "rdf" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0l32rjawsxhgi59y7lmjwgmnk32585gih1ylvy08m3vx7cdbzmdg";
      type = "gem";
    };
    version = "3.3.1";
  };
  json-schema = {
    dependencies = [ "addressable" "bigdecimal" ];
    groups = [ "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1gzrf6q4d9kbixj6bpi2bp8dizmqxcmlq30ni86h3ifzpkcrm0mk";
      type = "gem";
    };
    version = "5.1.1";
  };
  jsonapi-renderer = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0ys4drd0k9rw5ixf8n8fx8v0pjh792w4myh0cpdspd317l1lpi5m";
      type = "gem";
    };
    version = "0.2.2";
  };
  jwt = {
    dependencies = [ "base64" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0rba9mji57sfa1kjhj0bwff1377vj0i8yx2rd39j5ik4vp60gzam";
      type = "gem";
    };
    version = "2.9.3";
  };
  kaminari = {
    dependencies = [
      "activesupport"
      "kaminari-actionview"
      "kaminari-activerecord"
      "kaminari-core"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0gia8irryvfhcr6bsr64kpisbgdbqjsqfgrk12a11incmpwny1y4";
      type = "gem";
    };
    version = "1.2.2";
  };
  kaminari-actionview = {
    dependencies = [ "actionview" "kaminari-core" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "02f9ghl3a9b5q7l079d3yzmqjwkr4jigi7sldbps992rigygcc0k";
      type = "gem";
    };
    version = "1.2.2";
  };
  kaminari-activerecord = {
    dependencies = [ "activerecord" "kaminari-core" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0c148z97s1cqivzbwrak149z7kl1rdmj7dxk6rpkasimmdxsdlqd";
      type = "gem";
    };
    version = "1.2.2";
  };
  kaminari-core = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1zw3pg6kj39y7jxakbx7if59pl28lhk98fx71ks5lr3hfgn6zliv";
      type = "gem";
    };
    version = "1.2.2";
  };
  kt-paperclip = {
    dependencies =
      [ "activemodel" "activesupport" "marcel" "mime-types" "terrapin" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1j8z0757rb4kly4ghdzd6ihch6x5i0d53r543x2y9xa8cyrj7c4m";
      type = "gem";
    };
    version = "7.2.2";
  };
  language_server-protocol = {
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0gvb1j8xsqxms9mww01rmdl78zkd72zgxaap56bhv8j45z05hp1x";
      type = "gem";
    };
    version = "3.17.0.3";
  };
  launchy = {
    dependencies = [ "addressable" "childprocess" ];
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0b3zi9ydbibyyrrkr6l8mcs6l7yam18a4wg22ivgaz0rl2yn1ymp";
      type = "gem";
    };
    version = "3.0.1";
  };
  letter_opener = {
    dependencies = [ "launchy" ];
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1cnv3ggnzyagl50vzs1693aacv08bhwlprcvjp8jcg2w7cp3zwrg";
      type = "gem";
    };
    version = "1.10.0";
  };
  letter_opener_web = {
    dependencies = [ "actionmailer" "letter_opener" "railties" "rexml" ];
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0q4qfi5wnn5bv93zjf10agmzap3sn7gkfmdbryz296wb1vz1wf9z";
      type = "gem";
    };
    version = "3.0.0";
  };
  link_header = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1yamrdq4rywmnpdhbygnkkl9fdy249fg5r851nrkkxr97gj5rihm";
      type = "gem";
    };
    version = "0.0.8";
  };
  llhttp-ffi = {
    dependencies = [ "ffi-compiler" "rake" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1yph78m8w8l6i9833fc7shy5krk4mnqjc7ys0bg9kgxw8jnl0vs9";
      type = "gem";
    };
    version = "0.5.0";
  };
  logger = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0lwncq2rf8gm79g2rcnnyzs26ma1f4wnfjm6gs4zf2wlsdz5in9s";
      type = "gem";
    };
    version = "1.6.1";
  };
  lograge = {
    dependencies = [ "actionpack" "activesupport" "railties" "request_store" ];
    groups = [ "production" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1qcsvh9k4c0cp6agqm9a8m4x2gg7vifryqr7yxkg2x9ph9silds2";
      type = "gem";
    };
    version = "0.14.0";
  };
  loofah = {
    dependencies = [ "crass" "nokogiri" ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0ppp2cgli5avzk0z3dwnah6y65ymyr793yja28p2fs9vrci7986h";
      type = "gem";
    };
    version = "2.23.1";
  };
  mail = {
    dependencies = [ "mini_mime" "net-imap" "net-pop" "net-smtp" ];
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1bf9pysw1jfgynv692hhaycfxa8ckay1gjw5hz3madrbrynryfzc";
      type = "gem";
    };
    version = "2.8.1";
  };
  marcel = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "190n2mk8m1l708kr88fh6mip9sdsh339d2s6sgrik3sbnvz4jmhd";
      type = "gem";
    };
    version = "1.0.4";
  };
  mario-redis-lock = {
    dependencies = [ "redis" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1v9wdjcjqzpns2migxp4a5b4w82mipi0fwihbqz3q2qj2qm7wc17";
      type = "gem";
    };
    version = "1.2.1";
  };
  matrix = {
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1h2cgkpzkh3dd0flnnwfq6f3nl2b1zff9lvqz8xs853ssv5kq23i";
      type = "gem";
    };
    version = "0.4.2";
  };
  memory_profiler = {
    groups = [ "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1y58ba08n4lx123c0hjcc752fc4x802mjy39qj1hq50ak3vpv8br";
      type = "gem";
    };
    version = "1.1.0";
  };
  mime-types = {
    dependencies = [ "logger" "mime-types-data" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0r34mc3n7sxsbm9mzyzy8m3dvq7pwbryyc8m452axkj0g2axnwbg";
      type = "gem";
    };
    version = "3.6.0";
  };
  mime-types-data = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1hf4hjldl0rjqxda6lgsg64d5d28nw3s5pacdpnc01a2fjqc2vqz";
      type = "gem";
    };
    version = "3.2024.1105";
  };
  mini_mime = {
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1vycif7pjzkr29mfk4dlqv3disc5dn0va04lkwajlpr1wkibg0c6";
      type = "gem";
    };
    version = "1.1.5";
  };
  mini_portile2 = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0x8asxl83msn815lwmb2d7q5p29p7drhjv5va0byhk60v9n16iwf";
      type = "gem";
    };
    version = "2.8.8";
  };
  minitest = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1sw3kvajbs5fvlqf1cz2kd6641iibmrc8idm4y8ian007vb7kcsr";
      type = "gem";
    };
    version = "5.25.2";
  };
  msgpack = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1a5fsgchkpcca4wf3pipbb2jbj523l7fbaq37j10cr0yymwlkc7z";
      type = "gem";
    };
    version = "1.7.5";
  };
  multi_json = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0pb1g1y3dsiahavspyzkdy39j4q377009f6ix0bh1ag4nqw43l0z";
      type = "gem";
    };
    version = "1.15.0";
  };
  mutex_m = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0l875dw0lk7b2ywa54l0wjcggs94vb7gs8khfw9li75n2sn09jyg";
      type = "gem";
    };
    version = "0.3.0";
  };
  net-http = {
    dependencies = [ "uri" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1np1di3wnjmdnsf0h0yg5m902b0zv7g82jra2i9vy0zyb8h8hzzd";
      type = "gem";
    };
    version = "0.5.0";
  };
  net-imap = {
    dependencies = [ "date" "net-protocol" ];
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1mrqr1xknw4z1nzjvdaff1gd504fkwaqdb6ibqfhixsrhifvikn0";
      type = "gem";
    };
    version = "0.5.1";
  };
  net-ldap = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0g9gz39bs2iy4ky4fhjphimqd9m9wdsaz50anxgwg3yjrff3famy";
      type = "gem";
    };
    version = "0.19.0";
  };
  net-pop = {
    dependencies = [ "net-protocol" ];
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1wyz41jd4zpjn0v1xsf9j778qx1vfrl24yc20cpmph8k42c4x2w4";
      type = "gem";
    };
    version = "0.1.2";
  };
  net-protocol = {
    dependencies = [ "timeout" ];
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1a32l4x73hz200cm587bc29q8q9az278syw3x6fkc9d1lv5y0wxa";
      type = "gem";
    };
    version = "0.2.2";
  };
  net-smtp = {
    dependencies = [ "net-protocol" ];
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0amlhz8fhnjfmsiqcjajip57ici2xhw089x7zqyhpk51drg43h2z";
      type = "gem";
    };
    version = "0.5.0";
  };
  nio4r = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1a9www524fl1ykspznz54i0phfqya4x45hqaz67in9dvw1lfwpfr";
      type = "gem";
    };
    version = "2.7.4";
  };
  nokogiri = {
    dependencies = [ "mini_portile2" "racc" ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "15gysw8rassqgdq3kwgl4mhqmrgh7nk2qvrcqp4ijyqazgywn6gq";
      type = "gem";
    };
    version = "1.16.7";
  };
  oj = {
    dependencies = [ "bigdecimal" "ostruct" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0g81wk4d16c1i46wm9f7qh7hqi70i8xl9gpq07y1mfwgpi6w56gi";
      type = "gem";
    };
    version = "3.16.7";
  };
  omniauth = {
    dependencies = [ "hashie" "rack" "rack-protection" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1km0wqx9pj609jidvrqfsvzbzfgdnlpdnv7i7xfqm3wb55vk5w6y";
      type = "gem";
    };
    version = "2.1.2";
  };
  omniauth-cas = {
    dependencies = [ "addressable" "nokogiri" "omniauth" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "13z686dmkdssm4d5b0k45ydavhjrzcaqzyqxvvmaqn3a0vc6klbs";
      type = "gem";
    };
    version = "3.0.0";
  };
  omniauth-rails_csrf_protection = {
    dependencies = [ "actionpack" "omniauth" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1q2zvkw34vk1vyhn5kp30783w1wzam9i9g5ygsdjn2gz59kzsw0i";
      type = "gem";
    };
    version = "1.0.2";
  };
  omniauth-saml = {
    dependencies = [ "omniauth" "ruby-saml" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "00nn24s74miy7p65y8lwpjfwgcn7fwld61f9ghngal4asgw6pfwa";
      type = "gem";
    };
    version = "2.2.1";
  };
  omniauth_openid_connect = {
    dependencies = [ "omniauth" "openid_connect" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "08yl0x203k6nrshc70zawfqh79ap1c3fyka9zwwy61cvn7sih4sz";
      type = "gem";
    };
    version = "0.6.1";
  };
  openid_connect = {
    dependencies = [
      "activemodel"
      "attr_required"
      "json-jwt"
      "net-smtp"
      "rack-oauth2"
      "swd"
      "tzinfo"
      "validate_email"
      "validate_url"
      "webfinger"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1k9kdivp45v6vhzdrnl5fzhd378gjj2hl4w9bazbqnfm15rsnzc8";
      type = "gem";
    };
    version = "1.4.2";
  };
  openssl = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "054d6ybgjdzxw567m7rbnd46yp6gkdbc5ihr536vxd3p15vbhjrw";
      type = "gem";
    };
    version = "3.2.0";
  };
  openssl-signature_algorithm = {
    dependencies = [ "openssl" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "103yjl68wqhl5kxaciir5jdnyi7iv9yckishdr52s5knh9g0pd53";
      type = "gem";
    };
    version = "1.3.0";
  };
  opentelemetry-api = {
    groups = [ "default" "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0dj0cqxz0fl2934pmq4pvnb4wpapjfcsjnzb8vll08bcspjdwcx7";
      type = "gem";
    };
    version = "1.4.0";
  };
  opentelemetry-common = {
    dependencies = [ "opentelemetry-api" ];
    groups = [ "default" "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "160ws06d8mzx3hwjss2i954h8r86dp3sw95k2wrbq81sb121m2gy";
      type = "gem";
    };
    version = "0.21.0";
  };
  opentelemetry-exporter-otlp = {
    dependencies = [
      "google-protobuf"
      "googleapis-common-protos-types"
      "opentelemetry-api"
      "opentelemetry-common"
      "opentelemetry-sdk"
      "opentelemetry-semantic_conventions"
    ];
    groups = [ "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1yl10v1vvb9krvvks0si5nbjpknz8lcbbcryqkf2g0db3kha072d";
      type = "gem";
    };
    version = "0.29.0";
  };
  opentelemetry-helpers-sql-obfuscation = {
    dependencies = [ "opentelemetry-common" ];
    groups = [ "default" "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "00i5vv210l3lfs4iqkhdij8wmrxvnc371pxzpwf9by4pxhmxadgl";
      type = "gem";
    };
    version = "0.2.1";
  };
  opentelemetry-instrumentation-action_mailer = {
    dependencies = [
      "opentelemetry-api"
      "opentelemetry-instrumentation-active_support"
      "opentelemetry-instrumentation-base"
    ];
    groups = [ "default" "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "03nbn48q5ymk4wyhvnqa1wzvi1mzy2cbc8pmpf26x217zy6dvwl8";
      type = "gem";
    };
    version = "0.2.0";
  };
  opentelemetry-instrumentation-action_pack = {
    dependencies = [
      "opentelemetry-api"
      "opentelemetry-instrumentation-base"
      "opentelemetry-instrumentation-rack"
    ];
    groups = [ "default" "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "00mbrqmpk7p3wy377izsspshzdb849b9dv22z8f2hajcpr2im0id";
      type = "gem";
    };
    version = "0.10.0";
  };
  opentelemetry-instrumentation-action_view = {
    dependencies = [
      "opentelemetry-api"
      "opentelemetry-instrumentation-active_support"
      "opentelemetry-instrumentation-base"
    ];
    groups = [ "default" "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "08ga079lc2xariw83xc4ly1kab718ripmfb9af7xh6vm9qajka3d";
      type = "gem";
    };
    version = "0.7.3";
  };
  opentelemetry-instrumentation-active_job = {
    dependencies = [ "opentelemetry-api" "opentelemetry-instrumentation-base" ];
    groups = [ "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0hirfvkg4kf575al080zvnpbxs3y9qlmzdr1w7qwkap7mjdks6r8";
      type = "gem";
    };
    version = "0.7.8";
  };
  opentelemetry-instrumentation-active_model_serializers = {
    dependencies = [ "opentelemetry-api" "opentelemetry-instrumentation-base" ];
    groups = [ "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0yw98f8z6k4c8ns7p8ik2dc68p4vbi12xnavzw0vqhlnny4nx0n7";
      type = "gem";
    };
    version = "0.20.2";
  };
  opentelemetry-instrumentation-active_record = {
    dependencies = [ "opentelemetry-api" "opentelemetry-instrumentation-base" ];
    groups = [ "default" "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "14aar8w2szn5fi7j3lg35qlq1r12ka6lvcrcn700agv5nm3han5y";
      type = "gem";
    };
    version = "0.8.1";
  };
  opentelemetry-instrumentation-active_support = {
    dependencies = [ "opentelemetry-api" "opentelemetry-instrumentation-base" ];
    groups = [ "default" "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1q07nn9ipq2yd7xjj24hh00cbvlda269k1l0xfkc8d8iw8mixrsg";
      type = "gem";
    };
    version = "0.6.0";
  };
  opentelemetry-instrumentation-base = {
    dependencies =
      [ "opentelemetry-api" "opentelemetry-common" "opentelemetry-registry" ];
    groups = [ "default" "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0psjpqigi7k0fky1kd54jzf9r779vh2c86ngjppn7ifmnh4n3r9y";
      type = "gem";
    };
    version = "0.22.6";
  };
  opentelemetry-instrumentation-concurrent_ruby = {
    dependencies = [ "opentelemetry-api" "opentelemetry-instrumentation-base" ];
    groups = [ "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1khlhzwb37mqnzr1vr49ljhi4bplmq9w8ndm0k8xbfsr8h8wivq4";
      type = "gem";
    };
    version = "0.21.4";
  };
  opentelemetry-instrumentation-excon = {
    dependencies = [ "opentelemetry-api" "opentelemetry-instrumentation-base" ];
    groups = [ "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1x49m71zz8vbvv39gfbfvllnrflf2284r4f3bgbnb3l0b9din3zc";
      type = "gem";
    };
    version = "0.22.5";
  };
  opentelemetry-instrumentation-faraday = {
    dependencies = [ "opentelemetry-api" "opentelemetry-instrumentation-base" ];
    groups = [ "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1azbnb3f6lbmjciqdy5awyv6lhnkcyd4wqr6ayj8glj4v7b8bprn";
      type = "gem";
    };
    version = "0.24.7";
  };
  opentelemetry-instrumentation-http = {
    dependencies = [ "opentelemetry-api" "opentelemetry-instrumentation-base" ];
    groups = [ "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "07jycg8iicrcadhnpg1zd2fp6di5hddq6cdpfmz499r2lzwv9wbi";
      type = "gem";
    };
    version = "0.23.5";
  };
  opentelemetry-instrumentation-http_client = {
    dependencies = [ "opentelemetry-api" "opentelemetry-instrumentation-base" ];
    groups = [ "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0ss5izgcj2874df0yl4akcjvgsg2wyflvbq43aic2zw93dw4a7s1";
      type = "gem";
    };
    version = "0.22.8";
  };
  opentelemetry-instrumentation-net_http = {
    dependencies = [ "opentelemetry-api" "opentelemetry-instrumentation-base" ];
    groups = [ "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0bh462bpf9m1vg512y9dmjaj7hrlyy04qpwhrzjzmf14d25xcfq2";
      type = "gem";
    };
    version = "0.22.8";
  };
  opentelemetry-instrumentation-pg = {
    dependencies = [
      "opentelemetry-api"
      "opentelemetry-helpers-sql-obfuscation"
      "opentelemetry-instrumentation-base"
    ];
    groups = [ "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0ll2ka487ybsisk7c46lrag18nsfp9gbzrzmiyjjslnpiirc3gwc";
      type = "gem";
    };
    version = "0.29.1";
  };
  opentelemetry-instrumentation-rack = {
    dependencies = [ "opentelemetry-api" "opentelemetry-instrumentation-base" ];
    groups = [ "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0g94rqqgw1jhqfng2692559wrldl6xji45lhbr4id3l1dd7qp72k";
      type = "gem";
    };
    version = "0.25.0";
  };
  opentelemetry-instrumentation-rails = {
    dependencies = [
      "opentelemetry-api"
      "opentelemetry-instrumentation-action_mailer"
      "opentelemetry-instrumentation-action_pack"
      "opentelemetry-instrumentation-action_view"
      "opentelemetry-instrumentation-active_job"
      "opentelemetry-instrumentation-active_record"
      "opentelemetry-instrumentation-active_support"
      "opentelemetry-instrumentation-base"
    ];
    groups = [ "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "15kd44ilp029vadv0yyjnajwv7mn2f29647xxd0svqyd1bf9j1ji";
      type = "gem";
    };
    version = "0.33.1";
  };
  opentelemetry-instrumentation-redis = {
    dependencies = [ "opentelemetry-api" "opentelemetry-instrumentation-base" ];
    groups = [ "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1qrgnk2x64sks9gqb7fycfa6sass6ddqzh5dms4hdbz1bzag581f";
      type = "gem";
    };
    version = "0.25.7";
  };
  opentelemetry-instrumentation-sidekiq = {
    dependencies = [ "opentelemetry-api" "opentelemetry-instrumentation-base" ];
    groups = [ "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0cfzw1avv52idxvq02y95g3byxsswccck78zch5hmnnzvp5f59nn";
      type = "gem";
    };
    version = "0.25.7";
  };
  opentelemetry-registry = {
    dependencies = [ "opentelemetry-api" ];
    groups = [ "default" "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1pw87n9vpv40hf7f6gyl2vvbl11hzdkv4psbbv3x23jvccs8593k";
      type = "gem";
    };
    version = "0.3.1";
  };
  opentelemetry-sdk = {
    dependencies = [
      "opentelemetry-api"
      "opentelemetry-common"
      "opentelemetry-registry"
      "opentelemetry-semantic_conventions"
    ];
    groups = [ "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0div7n5wac7x1l9fwdpb3bllw18cns93c7xccy27r4gmvv02f46s";
      type = "gem";
    };
    version = "1.5.0";
  };
  opentelemetry-semantic_conventions = {
    dependencies = [ "opentelemetry-api" ];
    groups = [ "default" "opentelemetry" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "10anxw736pg85nw8vb11xnr5faq7qj8a1d8c62qbpjs6m0izi77y";
      type = "gem";
    };
    version = "1.10.1";
  };
  orm_adapter = {
    groups = [ "default" "pam_authentication" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1fg9jpjlzf5y49qs9mlpdrgs5rpcyihq1s4k79nv9js0spjhnpda";
      type = "gem";
    };
    version = "0.5.0";
  };
  ostruct = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "05xqijcf80sza5pnlp1c8whdaay8x5dc13214ngh790zrizgp8q9";
      type = "gem";
    };
    version = "0.6.1";
  };
  ox = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0w9gavjrvciip497hpdjpcs2c18vf6cgmlj696ynpaqv96804glr";
      type = "gem";
    };
    version = "2.14.18";
  };
  parallel = {
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1vy7sjs2pgz4i96v5yk9b7aafbffnvq7nn419fgvw55qlavsnsyq";
      type = "gem";
    };
    version = "1.26.3";
  };
  parser = {
    dependencies = [ "ast" "racc" ];
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0fxw738al3qxa4s4ghqkxb908sav03i3h7xflawwmxzhqiyfdm15";
      type = "gem";
    };
    version = "3.3.6.0";
  };
  parslet = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "01pnw6ymz6nynklqvqxs4bcai25kcvnd5x4id9z3vd1rbmlk0lfl";
      type = "gem";
    };
    version = "2.0.0";
  };
  pastel = {
    dependencies = [ "tty-color" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0xash2gj08dfjvq4hy6l1z22s5v30fhizwgs10d6nviggpxsj7a8";
      type = "gem";
    };
    version = "0.8.0";
  };
  pg = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1p2gqqrm895fzr9vi8d118zhql67bm8ydjvgqbq1crdnfggzn7kn";
      type = "gem";
    };
    version = "1.5.9";
  };
  pghero = {
    dependencies = [ "activerecord" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1m4wlwx37n1jsrdzxf824pz7j0p72i1al7ndmy6q5m3r77ngdm76";
      type = "gem";
    };
    version = "3.6.1";
  };
  premailer = {
    dependencies = [ "addressable" "css_parser" "htmlentities" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1ryivdnij1990hcqqmq4s0x1vjvfl0awjc9b91f8af17v2639qhg";
      type = "gem";
    };
    version = "1.27.0";
  };
  premailer-rails = {
    dependencies = [ "actionmailer" "net-smtp" "premailer" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0004f73kgrglida336fqkgx906m6n05nnfc17mypzg5rc78iaf61";
      type = "gem";
    };
    version = "1.12.0";
  };
  propshaft = {
    dependencies = [ "actionpack" "activesupport" "rack" "railties" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0sqg0xf46xd47zdpm8d12kfnwl0y5jb2hj10imzb3bk6mwgkd2fk";
      type = "gem";
    };
    version = "1.1.0";
  };
  psych = {
    dependencies = [ "stringio" ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0wq567f615x1ilgaqlh4yzf322f96rgn45xw4nm4vwfaddszw0v6";
      type = "gem";
    };
    version = "5.2.0";
  };
  public_suffix = {
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0vqcw3iwby3yc6avs1vb3gfd0vcp2v7q310665dvxfswmcf4xm31";
      type = "gem";
    };
    version = "6.0.1";
  };
  puma = {
    dependencies = [ "nio4r" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1wl9q4fl8gvhwdpfxghx6jdqi4508287pcgiwi96sdbzmdfbglcl";
      type = "gem";
    };
    version = "6.5.0";
  };
  pundit = {
    dependencies = [ "activesupport" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0wkm850z17gy5gph5lbmaz62wx7nvkj9r690017w10phkmxd5rj3";
      type = "gem";
    };
    version = "2.4.0";
  };
  raabro = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "10m8bln9d00dwzjil1k42i5r7l82x25ysbi45fwyv4932zsrzynl";
      type = "gem";
    };
    version = "1.4.0";
  };
  racc = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0byn0c9nkahsl93y9ln5bysq4j31q8xkf2ws42swighxd4lnjzsa";
      type = "gem";
    };
    version = "1.8.1";
  };
  rack = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0ax778fsfvlhj7c11n0d1wdcb8bxvkb190a9lha5d91biwzyx9g4";
      type = "gem";
    };
    version = "2.2.10";
  };
  rack-attack = {
    dependencies = [ "rack" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0z6pj5vjgl6swq7a33gssf795k958mss8gpmdb4v4cydcs7px91w";
      type = "gem";
    };
    version = "6.7.0";
  };
  rack-cors = {
    dependencies = [ "rack" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "06ysmn14pdf2wyr7agm0qvvr9pzcgyf39w4yvk2n05w9k4alwpa1";
      type = "gem";
    };
    version = "2.0.2";
  };
  rack-oauth2 = {
    dependencies =
      [ "activesupport" "attr_required" "httpclient" "json-jwt" "rack" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1fknwsxz4429w1hndl6y30cmm2n34wmmaaj2hhp6jrm8ssfsfwjf";
      type = "gem";
    };
    version = "1.21.3";
  };
  rack-protection = {
    dependencies = [ "base64" "rack" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1zzvivmdb4dkscc58i3gmcyrnypynsjwp6xgc4ylarlhqmzvlx1w";
      type = "gem";
    };
    version = "3.2.0";
  };
  rack-proxy = {
    dependencies = [ "rack" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "12jw7401j543fj8cc83lmw72d8k6bxvkp9rvbifi88hh01blnsj4";
      type = "gem";
    };
    version = "0.7.7";
  };
  rack-session = {
    dependencies = [ "rack" ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0xhxhlsz6shh8nm44jsmd9276zcnyzii364vhcvf0k8b8bjia8d0";
      type = "gem";
    };
    version = "1.0.2";
  };
  rack-test = {
    dependencies = [ "rack" ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1ysx29gk9k14a14zsp5a8czys140wacvp91fja8xcja0j1hzqq8c";
      type = "gem";
    };
    version = "2.1.0";
  };
  rackup = {
    dependencies = [ "rack" "webrick" ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1wbr03334ba9ilcq25wh9913xciwj0j117zs60vsqm0zgwdkwpp9";
      type = "gem";
    };
    version = "1.0.0";
  };
  rails = {
    dependencies = [
      "actioncable"
      "actionmailbox"
      "actionmailer"
      "actionpack"
      "actiontext"
      "actionview"
      "activejob"
      "activemodel"
      "activerecord"
      "activestorage"
      "activesupport"
      "railties"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1mwd3dy6blfghhx6il0ayy5qn9ngcvid4hbvgdqq8aqdnx3qi7dz";
      type = "gem";
    };
    version = "7.2.2";
  };
  rails-controller-testing = {
    dependencies = [ "actionpack" "actionview" "activesupport" ];
    groups = [ "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "151f303jcvs8s149mhx2g5mn67487x0blrf9dzl76q1nb7dlh53l";
      type = "gem";
    };
    version = "1.0.5";
  };
  rails-dom-testing = {
    dependencies = [ "activesupport" "minitest" "nokogiri" ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0fx9dx1ag0s1lr6lfr34lbx5i1bvn3bhyf3w3mx6h7yz90p725g5";
      type = "gem";
    };
    version = "2.2.0";
  };
  rails-html-sanitizer = {
    dependencies = [ "loofah" "nokogiri" ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1pm4z853nyz1bhhqr7fzl44alnx4bjachcr6rh6qjj375sfz3sc6";
      type = "gem";
    };
    version = "1.6.0";
  };
  rails-i18n = {
    dependencies = [ "i18n" "railties" ];
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1jiiv5ni1jrk15g572wc0l1ansbx6aqqsp2mk0pg9h18mkh1dbpg";
      type = "gem";
    };
    version = "7.0.10";
  };
  railties = {
    dependencies =
      [ "actionpack" "activesupport" "irb" "rackup" "rake" "thor" "zeitwerk" ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0z7mzf7d19z1czs32w0dhk6kasj7m2q0alwf7mppzzz1y38kvzg8";
      type = "gem";
    };
    version = "7.2.2";
  };
  rainbow = {
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0smwg4mii0fm38pyb5fddbmrdpifwv22zv3d3px2xx497am93503";
      type = "gem";
    };
    version = "3.1.1";
  };
  rake = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "17850wcwkgi30p7yqh60960ypn7yibacjjha0av78zaxwvd3ijs6";
      type = "gem";
    };
    version = "13.2.1";
  };
  rdf = {
    dependencies = [ "bcp47_spec" "bigdecimal" "link_header" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1mlalmbj1wkwvjha92f7v91v0pbjar9gdb2ddxdyqd24zcifn3ln";
      type = "gem";
    };
    version = "3.3.2";
  };
  rdf-normalize = {
    dependencies = [ "rdf" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1glyhg7lmzbq1w7bvvf84g7kvqxcn0mw3gsh1f8w4qfvvnbl8dwj";
      type = "gem";
    };
    version = "0.7.0";
  };
  rdoc = {
    dependencies = [ "psych" ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0ygk2zk0ky3d88v3ll7qh6xqvbvw5jin0hqdi1xkv1dhaw7myzdi";
      type = "gem";
    };
    version = "6.7.0";
  };
  redcarpet = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1sg9sbf9pm91l7lac7fs4silabyn0vflxwaa2x3lrzsm0ff8ilca";
      type = "gem";
    };
    version = "3.6.0";
  };
  redis = {
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0fikjg6j12ka6hh36dxzhfkpqqmilzjfzcdf59iwkzsgd63f0ziq";
      type = "gem";
    };
    version = "4.8.1";
  };
  redis-namespace = {
    dependencies = [ "redis" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0f92i9cwlp6xj6fyn7qn4qsaqvxfw4wqvayll7gbd26qnai1l6p9";
      type = "gem";
    };
    version = "1.11.0";
  };
  redlock = {
    dependencies = [ "redis" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0xvjwfzq7rqj4k311kidwmv5app3i7glz4miys6ixqy6c8yylz3c";
      type = "gem";
    };
    version = "1.3.2";
  };
  regexp_parser = {
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0ik40vcv7mqigsfpqpca36hpmnx0536xa825ai5qlkv3mmkyf9ss";
      type = "gem";
    };
    version = "2.9.2";
  };
  reline = {
    dependencies = [ "io-console" ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0rfblw8mnk8bwzcpqpan9vpblw4b4pxgdxw206kszjnrpx6mz3c6";
      type = "gem";
    };
    version = "0.5.11";
  };
  request_store = {
    dependencies = [ "rack" ];
    groups = [ "default" "production" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0kd4w7aa0sbk59b19s39pwhd636r7fjamrqalixsw5d53hs4sb1d";
      type = "gem";
    };
    version = "1.6.0";
  };
  responders = {
    dependencies = [ "actionpack" "railties" ];
    groups = [ "default" "pam_authentication" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "06ilkbbwvc8d0vppf8ywn1f79ypyymlb9krrhqv4g0q215zaiwlj";
      type = "gem";
    };
    version = "3.1.1";
  };
  rexml = {
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1j9p66pmfgxnzp76ksssyfyqqrg7281dyi3xyknl3wwraaw7a66p";
      type = "gem";
    };
    version = "3.3.9";
  };
  rotp = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0m48hv6wpmmm6cjr6q92q78h1i610riml19k5h1dil2yws3h1m3m";
      type = "gem";
    };
    version = "6.3.0";
  };
  rouge = {
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1pchwrkr0994v7mh054lcp0na3bk3mj2sk0dc33bn6bhxrnirj1a";
      type = "gem";
    };
    version = "4.5.1";
  };
  rpam2 = {
    groups = [ "default" "pam_authentication" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1zvli3s4z1hf2l7gyfickm5i3afjrnycc3ihbiax6ji6arpbyf33";
      type = "gem";
    };
    version = "4.0.2";
  };
  rqrcode = {
    dependencies = [ "chunky_png" "rqrcode_core" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1hggzz8i1l62pkkiybhiqv6ypxw7q844sddrrbbfczjcnj5sivi3";
      type = "gem";
    };
    version = "2.2.0";
  };
  rqrcode_core = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "06ld6386hbdhy5h0k09axmgn424kavpc8f27k1vjhknjhbf8jjfg";
      type = "gem";
    };
    version = "1.2.0";
  };
  rspec = {
    dependencies = [ "rspec-core" "rspec-expectations" "rspec-mocks" ];
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "14xrp8vq6i9zx37vh0yp4h9m0anx9paw200l1r5ad9fmq559346l";
      type = "gem";
    };
    version = "3.13.0";
  };
  rspec-core = {
    dependencies = [ "rspec-support" ];
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "001kazj244cb6fbkmh7ap74csbr78717qaskqzqpir1q8xpdmywl";
      type = "gem";
    };
    version = "3.13.2";
  };
  rspec-expectations = {
    dependencies = [ "diff-lcs" "rspec-support" ];
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0n3cyrhsa75x5wwvskrrqk56jbjgdi2q1zx0irllf0chkgsmlsqf";
      type = "gem";
    };
    version = "3.13.3";
  };
  rspec-github = {
    dependencies = [ "rspec-core" ];
    groups = [ "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0kqjmd85v2fpb06d0rx43dc51f0igc1gmm8y3nz0wvmy7zg02njm";
      type = "gem";
    };
    version = "2.4.0";
  };
  rspec-mocks = {
    dependencies = [ "diff-lcs" "rspec-support" ];
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1vxxkb2sf2b36d8ca2nq84kjf85fz4x7wqcvb8r6a5hfxxfk69r3";
      type = "gem";
    };
    version = "3.13.2";
  };
  rspec-rails = {
    dependencies = [
      "actionpack"
      "activesupport"
      "railties"
      "rspec-core"
      "rspec-expectations"
      "rspec-mocks"
      "rspec-support"
    ];
    groups = [ "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0izfwfb9bfb5q3wjgjc85b9nlkribqn8vk75zadafv08qilmnn4l";
      type = "gem";
    };
    version = "7.1.0";
  };
  rspec-sidekiq = {
    dependencies =
      [ "rspec-core" "rspec-expectations" "rspec-mocks" "sidekiq" ];
    groups = [ "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "08sbi3cdh6pxj0mj34vzr7675rb4n2r2q5yxlgs0w9xnm5c0jpdx";
      type = "gem";
    };
    version = "5.0.0";
  };
  rspec-support = {
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "03z7gpqz5xkw9rf53835pa8a9vgj4lic54rnix9vfwmp2m7pv1s8";
      type = "gem";
    };
    version = "3.13.1";
  };
  rubocop = {
    dependencies = [
      "json"
      "language_server-protocol"
      "parallel"
      "parser"
      "rainbow"
      "regexp_parser"
      "rubocop-ast"
      "ruby-progressbar"
      "unicode-display_width"
    ];
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1rsyxrl647bz49gpa4flh8igg6wy7qxyh2jrp01x0kqnn5iw4y86";
      type = "gem";
    };
    version = "1.66.1";
  };
  rubocop-ast = {
    dependencies = [ "parser" ];
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "03zywfpm4540q6hw8srhi8pzp0gg51w65ir8jkaw58vk3j31w820";
      type = "gem";
    };
    version = "1.32.3";
  };
  rubocop-capybara = {
    dependencies = [ "rubocop" ];
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1aw0n8jwhsr39r9q2k90xjmcz8ai2k7xx2a87ld0iixnv3ylw9jx";
      type = "gem";
    };
    version = "2.21.0";
  };
  rubocop-performance = {
    dependencies = [ "rubocop" "rubocop-ast" ];
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0yd616imfjvlpwsk7lw5kq9h4iz6qkmf10xlaib6b47fy5x77ncy";
      type = "gem";
    };
    version = "1.22.1";
  };
  rubocop-rails = {
    dependencies = [ "activesupport" "rack" "rubocop" "rubocop-ast" ];
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1zplyab5n8gh7zzbwrrxrkzb2406afrjm6a3a3zdx72k17swx9n3";
      type = "gem";
    };
    version = "2.27.0";
  };
  rubocop-rspec = {
    dependencies = [ "rubocop" ];
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1pj3n8pdws62f26pv32xna7j92p7cwq3nw0c73fn5awhfy65dj6j";
      type = "gem";
    };
    version = "3.2.0";
  };
  rubocop-rspec_rails = {
    dependencies = [ "rubocop" "rubocop-rspec" ];
    groups = [ "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0ijc1kw81884k0wjq1sgwaxa854n1fdddscp4fnzfzlx7zl150c8";
      type = "gem";
    };
    version = "2.30.0";
  };
  ruby-prof = {
    groups = [ "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "097ac9ns2j29zj5fw08libz8izibrlfgg6vkj55d4bzrii296qq2";
      type = "gem";
    };
    version = "1.7.1";
  };
  ruby-progressbar = {
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0cwvyb7j47m7wihpfaq7rc47zwwx9k4v7iqd9s1xch5nm53rrz40";
      type = "gem";
    };
    version = "1.13.0";
  };
  ruby-saml = {
    dependencies = [ "nokogiri" "rexml" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1adq06m684gnpjp6qyb8shgj8jjy2npcfg7y6mg2ab9ilfdq6684";
      type = "gem";
    };
    version = "1.17.0";
  };
  ruby-vips = {
    dependencies = [ "ffi" "logger" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0nyxwib3y2fc1lciaac0s03y3i915kyfq1kn9m19hyl5yblyhnxg";
      type = "gem";
    };
    version = "2.2.2";
  };
  rubyzip = {
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0grps9197qyxakbpw02pda59v45lfgbgiyw48i0mq9f2bn9y6mrz";
      type = "gem";
    };
    version = "2.3.2";
  };
  rufus-scheduler = {
    dependencies = [ "fugit" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "14lr8c2sswn0sisvrfi4448pmr34za279k3zlxgh581rl1y0gjjz";
      type = "gem";
    };
    version = "3.9.1";
  };
  safety_net_attestation = {
    dependencies = [ "jwt" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1khq0y5w7lf2b9a220298hphf3pakd216jc9a4x4a9pdwxs2vgln";
      type = "gem";
    };
    version = "0.4.0";
  };
  sanitize = {
    dependencies = [ "crass" "nokogiri" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0lj1jjxn1znxmaf6jnngfrz26rw85smxb69m4jl6a9yq6gwyab54";
      type = "gem";
    };
    version = "6.1.3";
  };
  scenic = {
    dependencies = [ "activerecord" "railties" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0w0dafg0gz3snm30247wwai0cy3j235ynwx2karyh05ayfqhm4ii";
      type = "gem";
    };
    version = "1.8.0";
  };
  securerandom = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1h4xx97w353z1ygg667iwf9il8llzz7xvf5znipb5fyza6kgzcp8";
      type = "gem";
    };
    version = "0.3.2";
  };
  selenium-webdriver = {
    dependencies = [ "base64" "logger" "rexml" "rubyzip" "websocket" ];
    groups = [ "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1q5nbszbxz566yzyiv0a4lvfk56q89k0lk4mqp6wyddrc2nz88c8";
      type = "gem";
    };
    version = "4.27.0";
  };
  semantic_range = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1dlp97vg95plrsaaqj7x8l7z9vsjbhnqk4rw1l30gy26lmxpfrih";
      type = "gem";
    };
    version = "3.0.0";
  };
  shoulda-matchers = {
    dependencies = [ "activesupport" ];
    groups = [ "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1c082vpfdf3865xq6xayxw2hwqswhnc9g030p1gi4hmk9dzvnmch";
      type = "gem";
    };
    version = "6.4.0";
  };
  sidekiq = {
    dependencies = [ "connection_pool" "rack" "redis" ];
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0zqr9is8y7mg5dfs1q8w5jl9spwvqkhbi9r6np8208n40hi3pydl";
      type = "gem";
    };
    version = "6.5.12";
  };
  sidekiq-bulk = {
    dependencies = [ "sidekiq" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "08nyxzmgf742irafy3l4fj09d4s5pyvsh0dzlh8y4hl51rgkh4xv";
      type = "gem";
    };
    version = "0.2.0";
  };
  sidekiq-scheduler = {
    dependencies = [ "rufus-scheduler" "sidekiq" "tilt" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1gnm98hdw1ndw0sryjimp4a0805yhwhjxg6njhz8xmdh5ycgljda";
      type = "gem";
    };
    version = "5.0.6";
  };
  sidekiq-unique-jobs = {
    dependencies =
      [ "brpoplpush-redis_script" "concurrent-ruby" "redis" "sidekiq" "thor" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1am17wfx023z1x9sxq90cyjarcmcwb95mi456mcf13m783r4n190";
      type = "gem";
    };
    version = "7.1.33";
  };
  simple-navigation = {
    dependencies = [ "activesupport" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1wc1rapwhqymcjfxmlgam4cvbyhnzfxada2damq88ij2p77pjz4q";
      type = "gem";
    };
    version = "4.4.0";
  };
  simple_form = {
    dependencies = [ "actionpack" "activemodel" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0q3lwin7pk5rsxy2a663x6lph5arax9lqqk12fgwdy57i5ma749q";
      type = "gem";
    };
    version = "5.3.1";
  };
  simplecov = {
    dependencies = [ "docile" "simplecov-html" "simplecov_json_formatter" ];
    groups = [ "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "198kcbrjxhhzca19yrdcd6jjj9sb51aaic3b0sc3pwjghg3j49py";
      type = "gem";
    };
    version = "0.22.0";
  };
  simplecov-html = {
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "02zi3rwihp7rlnp9x18c9idnkx7x68w6jmxdhyc0xrhjwrz0pasx";
      type = "gem";
    };
    version = "0.13.1";
  };
  simplecov-lcov = {
    groups = [ "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1h8kswnshgb9zidvc88f4zjy4gflgz3854sx9wrw8ppgnwfg6581";
      type = "gem";
    };
    version = "0.8.0";
  };
  simplecov_json_formatter = {
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0a5l0733hj7sk51j81ykfmlk2vd5vaijlq9d5fn165yyx3xii52j";
      type = "gem";
    };
    version = "0.1.4";
  };
  stackprof = {
    groups = [ "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1gdqqwnampxmc54nf6zfy9apkmkpdavzipvfssmjlhnrrjy8qh7f";
      type = "gem";
    };
    version = "0.2.26";
  };
  stoplight = {
    dependencies = [ "redlock" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0qq3z6mwbgj1q3b9hpxxi98i63jpqycbv13fqb8362ngk7cv06x8";
      type = "gem";
    };
    version = "4.1.0";
  };
  stringio = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0cd1kdrf62p2ya3ia4rz49d5012bqinvqjmcgkakknswz0l1hkr0";
      type = "gem";
    };
    version = "3.1.2";
  };
  strong_migrations = {
    dependencies = [ "activerecord" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1ycj02hhm44c3dv4mrnapkyllhhhysidc3ifx2i7d4jg9hrib06l";
      type = "gem";
    };
    version = "2.1.0";
  };
  swd = {
    dependencies = [ "activesupport" "attr_required" "httpclient" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "12b3q2sw42nnilfb51nlqdv07f31vdv2j595kd99asnkw4cjlf5w";
      type = "gem";
    };
    version = "1.3.0";
  };
  sysexits = {
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0qjng6pllznmprzx8vb0zg0c86hdrkyjs615q41s9fjpmv2430jr";
      type = "gem";
    };
    version = "1.2.0";
  };
  temple = {
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0fwia5hvc1xz9w7vprzjnsym3v9j5l9ggdvy70jixbvpcpz4acfz";
      type = "gem";
    };
    version = "0.10.3";
  };
  terminal-table = {
    dependencies = [ "unicode-display_width" ];
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "14dfmfjppmng5hwj7c5ka6qdapawm3h6k9lhn8zj001ybypvclgr";
      type = "gem";
    };
    version = "3.0.2";
  };
  terrapin = {
    dependencies = [ "climate_control" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0k968xzamd4y92zflrdilvc7wp8cj49n9lz34vnm95rg1j2gbqnx";
      type = "gem";
    };
    version = "1.0.1";
  };
  test-prof = {
    groups = [ "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1mydvmcm4m5501322wyl3pwmc6i5ijvwh4kb242l085j88hiqp4n";
      type = "gem";
    };
    version = "1.4.2";
  };
  thor = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1nmymd86a0vb39pzj2cwv57avdrl6pl3lf5bsz58q594kqxjkw7f";
      type = "gem";
    };
    version = "1.3.2";
  };
  tilt = {
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0kds7wkxmb038cwp6ravnwn8k65ixc68wpm8j5jx5bhx8ndg4x6z";
      type = "gem";
    };
    version = "2.4.0";
  };
  timeout = {
    groups = [ "default" "development" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "06fcniirx82hrljzfn5wb3634n8648v8qgy006jzgclfz5gjvjla";
      type = "gem";
    };
    version = "0.4.2";
  };
  tpm-key_attestation = {
    dependencies = [ "bindata" "openssl" "openssl-signature_algorithm" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "18xc7hyasg5ja2i2vb23d9c5pd6rf316kzwqxqx5d8vbs2z1a4rw";
      type = "gem";
    };
    version = "0.12.1";
  };
  tty-color = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0aik4kmhwwrmkysha7qibi2nyzb4c8kp42bd5vxnf8sf7b53g73g";
      type = "gem";
    };
    version = "0.6.0";
  };
  tty-cursor = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0j5zw041jgkmn605ya1zc151bxgxl6v192v2i26qhxx7ws2l2lvr";
      type = "gem";
    };
    version = "0.7.1";
  };
  tty-prompt = {
    dependencies = [ "pastel" "tty-reader" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1j4y8ik82azjxshgd4i1v4wwhsv3g9cngpygxqkkz69qaa8cxnzw";
      type = "gem";
    };
    version = "0.23.1";
  };
  tty-reader = {
    dependencies = [ "tty-cursor" "tty-screen" "wisper" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1cf2k7w7d84hshg4kzrjvk9pkyc2g1m3nx2n1rpmdcf0hp4p4af6";
      type = "gem";
    };
    version = "0.9.0";
  };
  tty-screen = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0l4vh6g333jxm9lakilkva2gn17j6gb052626r1pdbmy2lhnb460";
      type = "gem";
    };
    version = "0.8.2";
  };
  twitter-text = {
    dependencies = [ "idn-ruby" "unf" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1dnmp0bj3l01nbb52zby2c7hrazcdwfg846knkrjdfl0yfmv793z";
      type = "gem";
    };
    version = "3.1.0";
  };
  tzinfo = {
    dependencies = [ "concurrent-ruby" ];
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "16w2g84dzaf3z13gxyzlzbf748kylk5bdgg3n1ipvkvvqy685bwd";
      type = "gem";
    };
    version = "2.0.6";
  };
  tzinfo-data = {
    dependencies = [ "tzinfo" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1cw6xv9a525mcs7202bq9768aic1dwx353prm1bss4fp2nq24a3j";
      type = "gem";
    };
    version = "1.2024.2";
  };
  unf = {
    dependencies = [ "unf_ext" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0bh2cf73i2ffh4fcpdn9ir4mhq8zi50ik0zqa1braahzadx536a9";
      type = "gem";
    };
    version = "0.1.4";
  };
  unf_ext = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1sf6bxvf6x8gihv6j63iakixmdddgls58cpxpg32chckb2l18qcj";
      type = "gem";
    };
    version = "0.0.9.1";
  };
  unicode-display_width = {
    groups = [ "default" "development" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0nkz7fadlrdbkf37m0x7sw8bnz8r355q3vwcfb9f9md6pds9h9qj";
      type = "gem";
    };
    version = "2.6.0";
  };
  uri = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "07ndgxyhzd02cg94s6rnfhkb9rwx9z72lzk368sa9j78wc9qnbfz";
      type = "gem";
    };
    version = "0.13.1";
  };
  useragent = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1fv5kvq494swy0p17h9qya9r50w15xsi9zmvhzb8gh55kq6ki50p";
      type = "gem";
    };
    version = "0.16.10";
  };
  validate_email = {
    dependencies = [ "activemodel" "mail" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1r1fz29l699arka177c9xw7409d1a3ff95bf7a6pmc97slb91zlx";
      type = "gem";
    };
    version = "0.1.6";
  };
  validate_url = {
    dependencies = [ "activemodel" "public_suffix" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0lblym140w5n88ijyfgcvkxvpfj8m6z00rxxf2ckmmhk0x61dzkj";
      type = "gem";
    };
    version = "1.0.15";
  };
  warden = {
    dependencies = [ "rack" ];
    groups = [ "default" "pam_authentication" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1l7gl7vms023w4clg02pm4ky9j12la2vzsixi2xrv9imbn44ys26";
      type = "gem";
    };
    version = "1.2.9";
  };
  webauthn = {
    dependencies = [
      "android_key_attestation"
      "bindata"
      "cbor"
      "cose"
      "openssl"
      "safety_net_attestation"
      "tpm-key_attestation"
    ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0f3aygrmd1gnhq6mffm76jg5c15z7jdbrzm8iszmpj3394ihprs6";
      type = "gem";
    };
    version = "3.2.2";
  };
  webfinger = {
    dependencies = [ "activesupport" "httpclient" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "18jj50b44a471ig7hw1ax90wxaaz40acmrf6cm7m2iyshlffy53q";
      type = "gem";
    };
    version = "1.2.0";
  };
  webmock = {
    dependencies = [ "addressable" "crack" "hashdiff" ];
    groups = [ "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "08kixkdp41dw39kqfxf2wp5m4z9b6fxg6yfa6xin0wy7dxzka0dy";
      type = "gem";
    };
    version = "3.24.0";
  };
  webpacker = {
    dependencies = [ "activesupport" "rack-proxy" "railties" "semantic_range" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0fh4vijqiq1h7w28llk67y9csc0m4wkdivrsl4fsxg279v6j5z3i";
      type = "gem";
    };
    version = "5.4.4";
  };
  webpush = {
    dependencies = [ "hkdf" "jwt" ];
    groups = [ "default" ];
    platforms = [ ];
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
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0r79mir4phdmcx0l4yqfwfzdy8vgvrl4ym07585rd2b401bhrrcy";
      type = "gem";
    };
    version = "1.9.0";
  };
  websocket = {
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0dr78vh3ag0d1q5gfd8960g1ca9g6arjd2w54mffid8h4i7agrxp";
      type = "gem";
    };
    version = "1.2.11";
  };
  websocket-driver = {
    dependencies = [ "websocket-extensions" ];
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1nyh873w4lvahcl8kzbjfca26656d5c6z3md4sbqg5y1gfz0157n";
      type = "gem";
    };
    version = "0.7.6";
  };
  websocket-extensions = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0hc2g9qps8lmhibl5baa91b4qx8wqw872rgwagml78ydj8qacsqw";
      type = "gem";
    };
    version = "0.1.5";
  };
  wisper = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1rpsi0ziy78cj82sbyyywby4d0aw0a5q84v65qd28vqn79fbq5yf";
      type = "gem";
    };
    version = "2.0.1";
  };
  xorcist = {
    groups = [ "default" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "1dbbiy8xlcfvn9ais37xfb5rci4liwakkmxzbkp72wmvlgcrf339";
      type = "gem";
    };
    version = "1.1.3";
  };
  xpath = {
    dependencies = [ "nokogiri" ];
    groups = [ "default" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0bh8lk9hvlpn7vmi6h4hkcwjzvs2y0cmkk3yjjdr8fxvj6fsgzbd";
      type = "gem";
    };
    version = "3.2.0";
  };
  zeitwerk = {
    groups =
      [ "default" "development" "pam_authentication" "production" "test" ];
    platforms = [ ];
    source = {
      remotes = [ "https://rubygems.org" ];
      sha256 = "0mi7b90hvc6nqv37q27df4i2m27yy56yfy2ki5073474a1h9hi89";
      type = "gem";
    };
    version = "2.7.1";
  };
}

