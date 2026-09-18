# Project Zomboid Chinese Translations

Project Zomboid **B42.20** 简体中文（CN）与繁體中文（CH）汉化合集。

Seven translation add-ons for Project Zomboid B42.20. Install the original mods
alongside these add-ons. Chinese translations are selected by the game language.

## 汉化包 / Add-ons

| 汉化包 / Add-on | Mod ID | 汉化工坊 / Translation | 原版 / Original |
| --- | --- | --- | --- |
| KI5 Vehicle Collection | KI5CN | [Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3782418515) | [Original](https://steamcommunity.com/sharedfiles/filedetails/?id=3652192243) |
| Open All Containers | OpenAllContainersZH | [Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3782589460) | [Original](https://steamcommunity.com/sharedfiles/filedetails/?id=3465040406) |
| Spongie's Character Customisation | SPNCCZH | [Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3782589562) | [Original](https://steamcommunity.com/sharedfiles/filedetails/?id=3414634809) |
| Tomb's Player Body - Customisation | TombBodyCustomZH | [Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3782589610) | [Original](https://steamcommunity.com/sharedfiles/filedetails/?id=3429790870) |
| Here Goes The Sun | HereGoesTheSunZH | [Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3782589644) | [Original](https://steamcommunity.com/sharedfiles/filedetails/?id=3618557184) |
| Climb Ladders | ClimbLaddersZH | [Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3782589681) | [Original](https://steamcommunity.com/sharedfiles/filedetails/?id=3774776279) |
| More Damaged Objects | MoreDamagedObjectsZH | [Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3782589706) | [Original](https://steamcommunity.com/sharedfiles/filedetails/?id=3413150945) |

## 安装 / Installation

推荐订阅上表中的汉化与原版工坊条目，并在游戏中同时启用对应 Mod。

手动安装：将本仓库 mods/ 中需要的文件夹复制到用户的 Zomboid/mods/
目录，启用原版与汉化附属 Mod，并选择简体中文或繁體中文。

For manual installation, copy the required folders under mods/ to your
user Zomboid/mods/ directory and enable both the originals and the add-ons.

## 范围 / Scope

汉化包只发布 CN/CH 文本；原版英文由原作者维护。本仓库不包含原模组的代码、
模型、贴图或游戏文件。KI5CN 0.3.7 另含仅在简繁中文客户端生效的名称兼容代码，
用于修正本体及当前启用 KI5 车型的既有英文车钥匙名称，并补全 damnlib 三种模具
的动态物品名称。本版在既有 M923、G 系列与 Chevrolet K 系列汉化基础上，继续补入 2026-09-17 更新的
Campers! 新 Airflyte / Astrodome、Chevelle Nomad SS 以及 Containers! v2.00 新集装箱车型，并补齐 Shasta 零件/配方、Containers 新车架/配方/生成选项，同时按上游原文校正新旧集装箱车型名称。0.3.7 进一步统一全部 B42 新配方 key 与兼容 Recipe_ key 的中文文本，避免同一配方因调用路径不同而显示不同译法。它不修改
原模组文件、物品 ID、制作数据或车辆生成规则。

The original mods remain required. Their code, models, textures and game files
are not redistributed here. KI5CN 0.3.7 includes CN/CH client-side compatibility
for saved English vehicle-key names from the base game and enabled KI5 vehicles,
plus three dynamic damnlib mold item names. This release also follows the 2026-09-17 KI5 updates by adding CN/CH vehicle names for
the new Campers! Airflyte / Astrodome variants, Chevelle Nomad SS and Containers! v2.00
container variants, plus the new Shasta parts/recipes and Containers frame/recipe/spawn-option text. Container labels are also aligned with the current upstream wording. Version 0.3.7 also normalizes every paired B42 recipe key and legacy Recipe_ compatibility key to the same CN/CH text, preventing the same recipe from showing different wording through different lookup paths. Original-mod files, item IDs, crafting data and vehicle spawn rules are
preserved.

已知问题：damnlib 制作异常分支的气泡文本“What did i expect?”仍为英文。

Known issue: damnlib still hard-codes “What did i expect?” in an exceptional
crafting speech bubble.

## 反馈 / Contributing

报告问题时，请提供汉化包名、游戏及原 Mod 版本、界面中的原文和建议译文。
提交译文修改时请同时提供 CN 与 CH，并保持翻译键和占位符不变。

Please include the add-on name, game/original-mod versions, affected text and
suggested wording. Translation changes should cover both CN and CH while
preserving keys and placeholders.

## 授权 / License

Kinkairy 在本公开导出中的原创代码与汉化贡献采用 MIT License，见 LICENSE。
原游戏、原模组及各自名称、商标等权利仍归对应权利人所有。

Kinkairy's original code and translation contributions in this public export
are available under the MIT License. Rights in the original game, original mods,
names and trademarks remain with their respective owners.
