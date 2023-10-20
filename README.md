# Formal specification of attestation mechanisms in Confidential Computing

This repo contains the material for formal specification of _architecturally-defined_ remote attestation in the following groups: 

1. _Vendor solutions_: 
	- Intel TDX 

2. _Architecture lead solutions_: 
	- Arm CCA

The groups are based on the level of customization possible. 

## Motivation 
Attestation is one of the most critical mechanisms of Confidential Computing. Unfortunately, the attestation mechanisms provided by TEEs are quite complex and thus these are not well-understood even by those who call themselves "experts". The project aims at a better understanding of these mechanisms and the underlying trust assumptions via formal specification and verification. These mechanisms can then be composed with transport protocols (e.g., TLS and SPDM) to build attestation _frameworks_. 

## Main Challenge
The main challenge is the extraction of the attestation protocol to be formalized, as all the vendors (including Intel, Arm, AMD and IBM) describe the protocols informally. 

## Approach 
Our formal models are based on: 
- in-depth reading of Intel and Arm specification documents
- our experience with Intel SGX (on which the attestation architecture Intel TDX is largely based)
- extensive discussions with Intel and Arm 

## Tool 
We use state-of-the-art symbolic security analysis tool [ProVerif](https://ieeexplore.ieee.org/document/9833653) for the specification of the protocols. 

## Technical Specifications
Authors: Muhammad Usama Sardar, Thomas Fossati, Simon Frost and Shale Xiong
- [Draft1](https://www.researchgate.net/publication/367284929_SoK_Attestation_in_Confidential_Computing) focusing on TEE-agnostic architecture
- Draft2 (coming soon) focusing on formal specification and verification

## Important results
- We formally prove the insecurity of the TCB claimed by Intel for TDX. This was reported to Intel and fixed in the latest specs. 
- We also noticed a suspicious activity where Intel updates all the TDX white papers and specifications on the same URLs (with the older version of specs just disappearing). We reported this to Intel privately and later [publicly](https://lists.confidentialcomputing.io/g/attestation/topic/full_transparency_of_intel/99387880). 

## Use cases 
- See [another interesting project](https://github.com/CCC-Attestation/attested-tls-poc) where our artifacts for Arm CCA are being used as a foundation for the formal verification of a specific proposal of composition of remote attestation and transport protocols (see corresponding [IETF draft](https://datatracker.ietf.org/doc/draft-fossati-tls-attestation/)).
- Intel is using our artifacts for Intel TDX for the formal verification of vTPM TD solution for Intel TDX. 

## Limitations
The symbolic security analysis has the following inherent limitations:
1. Cryptographic primitives (hash, encryption, MAC, digital signatures) are assumed to be perfect. 
2. Side-channels are out of scope. 

Complementary approaches and tools (e.g., [CryptoVerif](https://bblanche.gitlabpages.inria.fr/CryptoVerif/)) can be used to tackle these limitations. 

## Acknowledgments
We would like to thank the following for insightful discussions and helpful feedback.
- Nikolaus Thümmel (Scontain)
- Ante Derek (Univeristy of Zagreb)
- Jiewen Yao (Intel)

## Recent and Upcoming Talks and Research Visits
If you are around on any of the following venues of upcoming talks (in reverse chronological order) on the project, you are very welcome to join/meet. 

| Event/Host | Venue | Date(s) | Funding | Material |
| --- | --- | --- | --- | --- |
| [Program Analysis and Verification on Trusted Platforms (PAVeTrust) 2023](https://www.acsac.org/2023/workshops/pavetrust/) | Austin, Texas, USA | 5 December, 2023 | [TBTL](https://tbtl.com/) |  |
| [24th International Conference on Formal Engineering Methods (ICFEM 2023)](https://formal-analysis.com/icfem/2023/) | Brisbane, Australia | 21-24 November, 2023 | Partly by [TBTL](https://tbtl.com/) and [Flashbots](https://www.flashbots.net/); looking for sponsors  |  |
| [IETF 118](https://www.ietf.org/how/meetings/118/) | Prague, Czechia | 4-10 November, 2023 | [CPEC](https://www.perspicuous-computing.science/) |  |
| ~~[Hardware and Architectural Support for Security and Privacy (HASP) 2023](https://www.haspworkshop.org/2023/index.html)~~ | ~~Toronto, Canada~~ | ~~29 October, 2023~~ | - | Visa delayed |
| ~~[Formal Methods in Computer-Aided Design (FMCAD) 2023](https://fmcad.org/FMCAD23/)~~ | ~~Ames, Iowa, USA~~ | ~~23-27 October, 2023~~ | ~~[FMCAD Association](https://fmcad.or.at/)~~ | Visa delayed |
| [Confidential Computing Mini Summit (co-located with OSS EU)](https://events.linuxfoundation.org/open-source-summit-europe/features/co-located-events/#confidential-computing-mini-summit) | Bilbao, Spain | 18 September, 2023 | [CCC](https://confidentialcomputing.io/) | [slides](https://www.researchgate.net/publication/374002611_Presentation_Formal_Specification_and_Verification_of_Attestation_in_Confidential_Computing)  |
| CCC SIG Progress update| Virtual | 12 September, 2023 | - | [slides](https://www.researchgate.net/publication/373873503_Presentation_Formal_Specification_and_Verification_of_Architecturally-defined_Attestation_in_Confidential_Computing) |
| Research visit at [University of Edinburgh](https://www.ed.ac.uk/) and [Heriot-Watt University](https://www.hw.ac.uk/) | Edinburgh, UK | 11-13 September, 2023 | [EuroProofNet](https://europroofnet.github.io/) | - |
| [16th Conference on Intelligent Computer Mathematics (CICM)](https://cicm-conference.org/2023/cicm.php?event=&menu=general) | Cambridge, UK (Virtual) | 6 September, 2023 |  | [slides](https://www.researchgate.net/publication/373707043_Presentation_Formal_Specification_and_Verification_of_Attestation_in_Confidential_Computing) |
| [Highlights of Logic, Games and Automata](https://highlights-conference.org/2023/) | Kassel, Germany | 28 July, 2023 | [Secretarium](https://secretarium.com/) |  [slides](https://www.researchgate.net/publication/372746716_Presentation_Comprehensive_Specification_and_Formal_Analysis_of_Attestation_Mechanisms_in_Confidential_Computing)| 
| [Output](https://output-dd.de/) | Dresden, Germany | 29 June, 2023 | - | [slides](https://www.researchgate.net/publication/371948775_Presentation_Comprehensive_Specification_and_Formal_Analysis_of_Attestation_Mechanisms_in_Confidential_Computing) |
| Invited talk at [Formal Methods for Security Network](https://fmsec.github.io/fmsec/) and [Cyber Security & Privacy Seminar Series](https://uk-sps.org/seminars/)| Virtual | 28 June, 2023 | - | [slides](https://www.researchgate.net/publication/371936296_Comprehensive_Specification_and_Formal_Analysis_ofAttestation_Mechanisms_in_Confidential_Computing) [video](https://www.youtube.com/watch?v=ZS_9Hs4V2WE&ab_channel=UK-SPS) |
| [16th Interaction and Concurrency Experience (ICE)](https://www.discotec.org/2023/ice) | Lisbon, Portugal | 19 June, 2023 | [CPEC](https://www.perspicuous-computing.science/) | [slides](https://www.researchgate.net/publication/371762135_Presentation_Comprehensive_Specification_and_Formal_Analysis_of_Attestation_Mechanisms_in_Confidential_Computing) |
| [OCP Security](https://www.opencompute.org/wiki/Security) | Virtual | 13 June, 2023 | - | [slides](https://www.researchgate.net/publication/371562452_Presentation_Specification_and_Formal_Verification_of_Attestation_Mechanisms_in_Confidential_Computing)  [video](https://www.youtube.com/watch?v=5WXPcGKxlYc)|
| CCC SIG Progress update| Virtual | 6 June, 2023 | - | [slides](https://www.researchgate.net/publication/371339782_Presentation_Formal_Specification_of_Attestation_Mechanisms_in_Confidential_Computing_Progress_Update) [video](https://youtu.be/CeqfKEP8W4U?list=PLmfkUJc39uMhZsNGmpx-qD-uCoQyMglIp&t=1048)|
| [IEEE Symposium on Security and Privacy (SnP)](https://sp2023.ieee-security.org/index.html) | San Francisco, USA | 22-24 May, 2023 | [TBTL](https://tbtl.com/), [Flashbots](https://www.flashbots.net/) and [konVera](https://konvera.io/)| [slides](https://www.researchgate.net/publication/371034944_Presentation_Comprehensive_Specification_and_Formal_Analysis_of_Attestation_Mechanisms_in_Confidential_Computing) |
| Invited talk at [Heriot-Watt University](https://www.hw.ac.uk/): [Joining details](https://ittgroup.org/seminars/) | Edinburgh, UK | 17 May, 2023 | [EuroProofNet](https://europroofnet.github.io/) | [slides](https://www.researchgate.net/publication/370838319_Presentation_Comprehensive_Specification_and_Formal_Analysis_of_Attestation_Mechanisms_in_Confidential_Computing) |
| Invited talk at [University of Edinburgh](https://www.ed.ac.uk/): [Joining details](https://web.inf.ed.ac.uk/lfcs/events/lfcs-seminars/lfcs-seminars-2023/lfcs-seminar-tuesday-16-may-u-sardar) | Edinburgh, UK | 16 May, 2023 | [EuroProofNet](https://europroofnet.github.io/) | [slides](https://www.researchgate.net/publication/370844935_Presentation_Comprehensive_Specification_and_Formal_Analysis_of_Attestation_Mechanisms_in_Confidential_Computing) [video](https://www.youtube.com/watch?v=hqkXtGUpLUk)|
| [2023 OCP Regional Summit](https://2023ocpregional.fnvirtual.app/) | Prague, Czech Republic | 20 April, 2023 | [CPEC](https://www.perspicuous-computing.science/) | [slides](https://www.researchgate.net/publication/370131511_Presentation_Systemization_of_Knowledge_Attestation_in_Confidential_Computing) [video](https://www.youtube.com/watch?v=pJXvKvJVHt8)|
| [NSA Symposium on Hot Topics in the Science of Security (HotSoS)](https://cps-vo.org/group/hotsos) | Virtual | 3-5 April, 2023 | - | [slides](https://www.researchgate.net/publication/369794583_Presentation_SoK_Attestation_in_Confidential_Computing) |
| [2023 Annual Meeting of the WG "Formal Methods for Security"](https://gtmfs2023.sciencesconf.org/) | Roscoff, France | 28-30 Mar, 2023 | [CPEC](https://www.perspicuous-computing.science/) | [slides](https://www.researchgate.net/publication/369626152_SoK_Attestation_in_Confidential_Computing) |
| Invited talk at [CISPA Helmholtz Center for Information Security](https://cispa.de/en) | Saarbrücken, Germany | 15 Mar, 2023| [CPEC](https://www.perspicuous-computing.science/) | [slides](https://www.researchgate.net/publication/369375426_Presentation_Formal_Specification_and_Verification_of_Attestation_Mechanisms_in_Confidential_Computing) |
| Invited talk at [University of Luxembourg](https://wwwen.uni.lu/) | Luxembourg | 13-14 Mar, 2023 | [CritiX](https://wwwfr.uni.lu/snt/research/critix) @ [University of Luxembourg](https://wwwen.uni.lu/)| [slides](https://www.researchgate.net/publication/369227453_Formal_Specification_and_Verification_of_Attestation_Mechanisms_in_Confidential_Computing) |
| [WG3 Program Verification Meeting](https://europroofnet.github.io/wg3-timisoara/) of [EuroProofNet](https://europroofnet.github.io/) | Timisoara, Romania | 8-9 Feb, 2023 | [EuroProofNet](https://europroofnet.github.io/) | [slides](https://www.researchgate.net/publication/368543273_Presentation_Tools_and_Techniques_for_Symbolic_Protocol_Verification) |

## Feedback/Comments/Critique/Contributions
We would love to have your feedback (especially critique! yes, this is how the science progresses, but please be genuine!) and contributions. Contact [Muhammad Usama Sardar](https://tu-dresden.de/ing/informatik/sya/se/die-professur/beschaeftigte/muhammad-usama-sardar) on CCC Slack Workspace, or by email, or open an issue. 
