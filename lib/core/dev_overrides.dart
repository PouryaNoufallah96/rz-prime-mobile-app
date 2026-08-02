/// Local test/prod toggles.
///
/// Switch by commenting one line and uncommenting the other.
/// Keep the PROD lines active before shipping.
class DevOverrides {
  DevOverrides._();

  // ── WalletConnect QR (simulator ↔ real phone) ─────────────────────────────
  // TEST: open the QR page so a real phone wallet can pair with the simulator.
  // PROD: open the default Reown modal (in-app wallet picker).
  static const useWalletConnectQrForSimulator =
      // true; // TEST
      false; // PROD

  // ── Swap minimum buy amount ───────────────────────────────────────────────
  // TEST: low floor so you can place small test swaps.
  // PROD: null → use API/stage minimum (stats.minimumBuyAmount / stage.min).
  static const double? swapMinBuyAmountOverride =
      // 0.1; // TEST
      null; // PROD
}
