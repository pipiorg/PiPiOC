include(FetchContent)

set(PIPI_GIT_TAG	main)
set(PIPI_GIT_URL	https://github.com/pipiorg/PiPi.git)
set(PIPI_SOURCE_DIR	$(CMAKE_SOURCE_DIR)/ext/pipi)
set(PIPI_BINARY_DIR	${CMAKE_SOURCE_DIR}/ext-build/pipi)

FetchContent_Declare(
	pipi
	GIT_REPOSITORY	${PIPI_GIT_URL}
	PIPI_GIT_TAG	${PIPI_GIT_TAG}
	SOURCE_DIR		${PIPI_SOURCE_DIR}
	BINARY_DIR		${PIPI_BINARY_DIR}
)

FetchContent_MakeAvailable(pipi)