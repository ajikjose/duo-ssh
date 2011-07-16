mockduo with wrong CN

  $ cd ${TESTDIR}
  $ python mockduo.py certs/mockduo-wronghost.pem >/dev/null 2>&1 &
  $ MOCKPID=$!
  $ trap 'exec kill $MOCKPID >/dev/null 2>&1' EXIT
  $ sleep 0.5

Wrong hostname
  $ ./testpam.py -d -c confs/mockduo.conf -f whatever true
  [4] Failsafe Duo login for 'whatever': SSL: certificate subject name 'tests.mockduo' does not match target host name 'localhost'

With noverify
  $ ./testpam.py -d -c confs/mockduo_noverify.conf -f preauth-allow true
  [4] Skipped Duo login for 'preauth-allow': you rock