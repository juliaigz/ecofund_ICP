import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Iter "mo:base/Iter";

actor {
  type Wallet = {
    principalId : Text;
    accountId : Text;
  };
  let wallets = HashMap.HashMap<Text, Wallet>(0, Text.equal, Text.hash);
  wallets.put("1", { principalId = "5y3sh-tmxh2-3mw37-2u5cc-jztqx-6zlty-qvzxy-zdsvp-rjjmz-5thhd-3ae"; accountId = "null" });

  public func getWallet() : async [(Text, Wallet)] {
    let walletIter : Iter.Iter<(Text, Wallet)> = wallets.entries();
    let walletArray : [(Text, Wallet)] = Iter.toArray(walletIter);

    return walletArray;
  };
};
