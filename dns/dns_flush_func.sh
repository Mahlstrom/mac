#!/usr/bin/env bash
# official way to flush dns on OS X 10.7+
dns_flush() {
  sudo discoveryutil mdnsflushcache || sudo killall -HUP mDNSResponder
}
