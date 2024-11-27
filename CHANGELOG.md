# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- [research-pillars] Image service

### Changed

### Deprecated

### Removed

### Fixed

### Security

## [v1.14.0] - 2024-11-11

### Added

- [research-pillars] Add method to fetch single uploaded resource by ID

## [v1.13.0] - 2024-07-15

### Added

- [research-pillars] Add method to fetch all program related diffs

## [v1.12.1] - 2024-07-08

### Fixed

- [research-pillars] Add displays to GetProgramData endpoints

## [v1.12.0] - 2024-07-08

### Added

- [research-pillars] Displays endpoints

## [v1.11.0] - 2024-05-24

### Changed

- [research-pillars] download ticket request extended to include flags for FHIR and CSV

## [v1.10.0] - 2024-04-23

### Added

- [research-pillars] Add routines
- [research-pillars] Checks service

## [v1.9.0] - 2024-03-19

### Changed

- [research-pillars] Allow publishing of a study for testing

## [v1.8.0] - 2024-02-22

### Changed

- [research-pillars] Adjusted statistics endpoint to be more dynamic

## [v1.7.0] - 2024-02-07

### Added

- [research-pillars] statistics endpoint

## [v1.6.0] - 2024-02-02

### Added

- [research-pillars] utilities service with proxy endpoint for static api

## [v1.5.1] - 2023-12-11

### Changed

- [research-pillars] change consent version parameter type to int32

### Fixed

- [research-pillars] getProgamData doesnt return consents

## [v1.5.0] - 2023-12-08

### Added

- [research-pillars] Service for consents in api and static

## [v1.4.0] - 2023-12-04

### Added

- [research-pillars] endpoints to get download list and ticket

## [v1.3.0] - 2023-11-24

### Added

- [research-pillars] Service to fetch uploaded study data

## [v1.2.0] - 2023-11-13

### Added

- [research-pillars] endpoint to check name availability

## [v1.1.2] - 2023-09-11

### Fixed

- [research-pillars] standalone questionnaires need language parameter

## [v1.1.1] - 2023-09-11

### Fixed

- [research-pillars] standalone questionnaire type needs to be struct as it is FHIR

## [v1.1.0] - 2023-09-07

### Added

- [research-pillars] standalone surveys and questionnaires

## [v1.0.0] - 2023-09-04

### Added

- research-pillars
- utils for grpc server-to-server communication

[Unreleased]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.14.0...HEAD
[v1.14.0]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.13.0...v1.14.0
[v1.13.0]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.12.1...v1.13.0
[v1.12.1]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.12.0...v1.12.1
[v1.12.0]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.11.0...v1.12.0
[v1.11.0]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.10.0...v1.11.0
[v1.10.0]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.9.0...v1.10.0
[v1.9.0]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.8.0...v1.9.0
[v1.8.0]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.7.0...v1.8.0
[v1.7.0]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.6.0...v1.7.0
[v1.6.0]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.5.1...v1.6.0
[v1.5.1]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.5.0...v1.5.1
[v1.5.0]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.4.0...v1.5.0
[v1.4.0]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.3.0...v1.4.0
[v1.3.0]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.2.0...v1.3.0
[v1.2.0]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.1.2...v1.2.0
[v1.1.2]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.1.1...v1.1.2
[v1.1.1]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.1.0...v1.1.1
[v1.1.0]: https://github.com/gesundheitscloud/grpc-modules/compare/v1.0.0...v1.1.0
[v1.0.0]: https://github.com/gesundheitscloud/grpc-modules/releases/tag/v1.0.0
