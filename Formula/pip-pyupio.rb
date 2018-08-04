# -*- ruby -*-

class PipPyupio < Formula
  include Language::Python::Virtualenv

  desc 'Tool to update all your projects requirement.'
  homepage 'https://github.com/pyupio/pyup/'
  url 'https://files.pythonhosted.org/packages/52/78/0d4d40b54b0f4751386ed91f4d60497f89fe7bc99cb1ef1cd8c072ca5a7d/pyupio-1.0.1.tar.gz'
  sha256 '92bf30d1c8768a4ea3b95f847bfc99760ca684072605214415d9dcf7c1b435bf'

  depends_on 'python3'

  resource 'certifi' do
    url 'https://pypi.python.org/packages/20/d0/3f7a84b0c5b89e94abbd073a5f00c7176089f526edb056686751d5064cbd/certifi-2017.7.27.1.tar.gz'
    sha256 '40523d2efb60523e113b44602298f0960e900388cf3bb6043f645cf57ea9e3f5'
  end

  resource 'chardet' do
    url 'https://pypi.python.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz'
    sha256 '84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae'
  end

  resource 'click' do
    url 'https://pypi.python.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz'
    sha256 'f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b'
  end

  resource 'dparse' do
    url 'https://files.pythonhosted.org/packages/8d/89/39cdc1b885e0af65fd172be21c318c3c750d1fbca0582c7b7ffe9873ed78/dparse-0.4.1.tar.gz'
    sha256 '00a5fdfa900629e5159bf3600d44905b333f4059a3366f28e0dbd13eeab17b19'
  end

  resource 'hashin-pyup' do
    url 'https://pypi.python.org/packages/ff/81/46922ea555fc60153f1bd2c5ad7a7b843044f40971cb988834c1e8952094/hashin-pyup-0.7.2.tar.gz'
    sha256 '09910cb804a23a84ec5403dbb0280adcee58526480c4462cce340d015337a77d'
  end

  resource 'idna' do
    url 'https://pypi.python.org/packages/f4/bd/0467d62790828c23c47fc1dfa1b1f052b24efdf5290f071c7a91d0d82fd3/idna-2.6.tar.gz'
    sha256 '2c6a5de3089009e3da7c5dde64a141dbc8551d5b7f6cf4ed7c2568d0cc520a8f'
  end

  resource 'jinja2' do
    url 'https://pypi.python.org/packages/90/61/f820ff0076a2599dd39406dcb858ecb239438c02ce706c8e91131ab9c7f1/Jinja2-2.9.6.tar.gz'
    sha256 'ddaa01a212cd6d641401cb01b605f4a4d9f37bfc93043d7f760ec70fb99ff9ff'
  end

  resource 'packaging' do
    url 'https://pypi.python.org/packages/c6/70/bb32913de251017e266c5114d0a645f262fb10ebc9bf6de894966d124e35/packaging-16.8.tar.gz'
    sha256 '5d50835fdf0a7edf0b55e311b7c887786504efea1177abd7e69329a8e5ea619e'
  end

  resource 'MarkupSafe' do
    url 'https://pypi.python.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz'
    sha256 'a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665'
  end

  resource 'python-gitlab' do
    url 'https://files.pythonhosted.org/packages/d6/29/56dcfa743d4fcb29af9258a83b644a81decdf82fdeaf76d6c9f3a2085a77/python-gitlab-1.5.1.tar.gz'
    sha256 '807ee192d51286f21375f2e5870b2ebaec2af74b4359f5e72646cf49dff6448d'
  end

  resource 'pygithub' do
    url 'https://pypi.python.org/packages/ae/d6/e44d5c938bc0fde63e3ee9b3209bc9f2c30c86f211664f333f98c59d36f7/PyGithub-1.35.tar.gz'
    sha256 'fea1c5adedb0b2c641422efa7d22ad1af1b538a499faf25da14c0bb57e2cfefe'
  end

  resource 'pyjwt' do
    url 'https://pypi.python.org/packages/c9/2a/ffd27735280696f6f244c8d1b4d2dd130511340475a29768ed317f9eaf0c/PyJWT-1.5.3.tar.gz'
    sha256 '500be75b17a63f70072416843dc80c8821109030be824f4d14758f114978bae7'
  end

  resource 'pyparsing' do
    url 'https://pypi.python.org/packages/3c/ec/a94f8cf7274ea60b5413df054f82a8980523efd712ec55a59e7c3357cf7c/pyparsing-2.2.0.tar.gz'
    sha256 '0832bcf47acd283788593e7a0f542407bd9550a55a8a8435214a1960e04bcb04'
  end

  resource 'pyyaml' do
    url 'https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz'
    sha256 '3ef3092145e9b70e3ddd2c7ad59bdd0252a94dfe3949721633e41344de00a6bf'
  end

  resource 'requests' do
    url 'https://pypi.python.org/packages/b0/e1/eab4fc3752e3d240468a8c0b284607899d2fbfb236a56b7377a329aa8d09/requests-2.18.4.tar.gz'
    sha256 '9c443e7324ba5b85070c4a818ade28bfabedf16ea10206da1132edaa6dda237e'
  end

  resource 'safety' do
    url 'https://pypi.python.org/packages/db/35/f5b0b8cffd0b20283a6d27954890a7bf8d72359eb2c23e8c404967b3529b/safety-1.6.1.tar.gz'
    sha256 'ad875f56a9afcda5f981820a654cabecff299808307f1e89b2750e3231177608'
  end

  resource 'six' do
    url 'https://pypi.python.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz'
    sha256 '70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9'
  end

  resource 'tqdm' do
    url 'https://pypi.python.org/packages/68/bf/f1f515b82e15d367c073d4b1fd6d47ac072657b0b1ace45f17c50f8dc84c/tqdm-4.19.4.tar.gz'
    sha256 '7ca803c2ea268c6bdb541e2dac74a3af23cf4bf7b4132a6a78926d255f8c8df1'
  end

  resource 'urllib3' do
    url 'https://pypi.python.org/packages/ee/11/7c59620aceedcc1ef65e156cc5ce5a24ef87be4107c2b74458464e437a5d/urllib3-1.22.tar.gz'
    sha256 'cc44da8e1145637334317feebd728bd869a35285b93cbb4cca2577da7e62db4f'
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/pyupio", '--help'
  end
end
# EOF
