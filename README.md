# pl_3x25g_mrmac – Versal MRMAC

## Design Summary

This project uses the **Versal Integrated 100G Multirate Ethernet MAC Subsystem** to provide three Ethernet interfaces routed to the QSFP port on the **VPK180** board. The design supports **dynamic runtime rate switching** between 25G → 10G → 25G using `ethtool`.

Two versions are available, with driver patches located at:
`<Petalinux>/project-spec/meta-user/recipes-kernel/linux/linux-xlnx/`
- **2024.2**
- **2025.1**

The device tree can be updated to bring the link up at **10G by default** by modifying the `max-speed` property to `<10000>` for all interfaces (`mrmac_0_core`, `mrmac_0_core_1`, `mrmac_0_core_2`).

For example:
```
&mrmac_0_core{

    axistream-connected = <&MCDMA_0_axi_mcdma_0>;
    max-speed = <10000>;
    xlnx,num-queues = /bits/ 16 <0x1>;
    xlnx,gtpll = <&gt_pll>;
    xlnx,gtctrl = <&gt_ctrl_common>;
    local-mac-address = [00 0a 35 00 00 00];
    xlnx,channel-ids = "1";
    xlnx,addrwidth = <0x20>;
    interrupt-names = "mm2s_ch1_introut", "s2mm_ch1_introut";
    interrupt-parent = <&gic>;
    interrupts = <0 84 4 0 85 4>;
    xlnx,axi_mux = <&axi_mux>;
};

```
