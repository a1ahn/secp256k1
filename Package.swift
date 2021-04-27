// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "secp256k1",
    products: [
        .library(name: "secp256k1", targets: ["secp256k1"]),
    ],
    targets: [
        .target(
            name: "secp256k1",
            path: ".",
            sources: [
                ".",
                "src/",
                "src/asm",
                "src/modules/ecdh",
                "src/modules/recovery"
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("src"),
                .headerSearchPath("."),
                .define("ENABLE_MODULE_ECDH"),
                .define("ENABLE_MODULE_RECOVERY"),
                .define("USE_NUM_NONE"),
                .define("USE_FIELD_INV_BUILTIN"),
                .define("USE_SCALAR_INV_BUILTIN"),
                .define("USE_FIELD_10X26"),
                .define("USE_SCALAR_8X32"),
                .define("ECMULT_GEN_PREC_BITS", to: "4"),
                .define("ECMULT_WINDOW_SIZE", to: "15"),
            ]
        ),
    ]
)
