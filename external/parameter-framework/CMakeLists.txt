project(libparameter)

set(PARAMETER_ROOT ${ANDROID_ROOT}/external/parameter-framework)

set(SOURCE_FILES
        ${PARAMETER_ROOT}/upstream/utility/DynamicLibrary.cpp
        ${PARAMETER_ROOT}/upstream/utility/posix/DynamicLibrary.cpp
        ${PARAMETER_ROOT}/upstream/utility/Tokenizer.cpp
        ${PARAMETER_ROOT}/upstream/utility/Utility.cpp
        )

add_library(libpfw_utility STATIC ${SOURCE_FILES})
target_include_directories(libpfw_utility PUBLIC
        ${PARAMETER_ROOT}/upstream/utility/
        )
target_compile_options(libpfw_utility PRIVATE
        -frtti
        -fexceptions
        )

set(SOURCE_FILES
        ${PARAMETER_ROOT}/upstream/remote-processor/RequestMessage.cpp
        ${PARAMETER_ROOT}/upstream/remote-processor/Message.cpp
        ${PARAMETER_ROOT}/upstream/remote-processor/AnswerMessage.cpp
        ${PARAMETER_ROOT}/upstream/remote-processor/RemoteProcessorServer.cpp
        ${PARAMETER_ROOT}/upstream/remote-processor/BackgroundRemoteProcessorServer.cpp
        )

include_directories($(PARAMETER_ROOT)/support/android/asio)
include_directories(SYSTEM $(PARAMETER_ROOT)/asio/include)

add_library(libremote-processor SHARED ${SOURCE_FILES})
target_include_directories(libremote-processor PUBLIC
        $(PARAMETER_ROOT)/upstream/remote-processor
        $(PARAMETER_ROOT)/support/android/remote-processor
        )
target_compile_options(libremote-processor PRIVATE
        -frtti
        -fexceptions
        )
target_link_libraries(libremote-processor
        libpfw_utility
        ${INTERMEDIATES_ROOT}/bionic/libc/crtbegin_so/android_arm64_armv8-a_cortex-a53_core/crtbegin_so.o
        )

set(SOURCE_FILES
        ${PARAMETER_ROOT}/upstream/parameter/ParameterMgrPlatformConnector.cpp
        ${PARAMETER_ROOT}/upstream/parameter/LoggingElementBuilderTemplate.cpp
        ${PARAMETER_ROOT}/upstream/parameter/StringParameterType.cpp
        ${PARAMETER_ROOT}/upstream/parameter/SyncerSet.cpp
        ${PARAMETER_ROOT}/upstream/parameter/BitParameter.cpp
        ${PARAMETER_ROOT}/upstream/parameter/BaseParameter.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ParameterBlockType.cpp
        ${PARAMETER_ROOT}/upstream/parameter/FloatingPointParameterType.cpp
        ${PARAMETER_ROOT}/upstream/parameter/SelectionCriteriaDefinition.cpp
        ${PARAMETER_ROOT}/upstream/parameter/EnumValuePair.cpp
        ${PARAMETER_ROOT}/upstream/parameter/SelectionCriteria.cpp
        ${PARAMETER_ROOT}/upstream/parameter/SelectionCriterionRule.cpp
        ${PARAMETER_ROOT}/upstream/parameter/AreaConfiguration.cpp
        ${PARAMETER_ROOT}/upstream/parameter/BitParameterBlockType.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ConfigurationAccessContext.cpp
        ${PARAMETER_ROOT}/upstream/parameter/BitwiseAreaConfiguration.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ArrayParameter.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ParameterBlackboard.cpp
        ${PARAMETER_ROOT}/upstream/parameter/InstanceConfigurableElement.cpp
        ${PARAMETER_ROOT}/upstream/parameter/LogarithmicParameterAdaptation.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ConfigurableDomain.cpp
        ${PARAMETER_ROOT}/upstream/parameter/FormattedSubsystemObject.cpp
        ${PARAMETER_ROOT}/upstream/parameter/MappingData.cpp
        ${PARAMETER_ROOT}/upstream/parameter/SubsystemElementBuilder.cpp
        ${PARAMETER_ROOT}/upstream/parameter/BooleanParameterType.cpp
        ${PARAMETER_ROOT}/upstream/parameter/FixedPointParameterType.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ComponentType.cpp
        ${PARAMETER_ROOT}/upstream/parameter/EnumParameterType.cpp
        ${PARAMETER_ROOT}/upstream/parameter/RuleParser.cpp
        ${PARAMETER_ROOT}/upstream/parameter/VirtualSubsystem.cpp
        ${PARAMETER_ROOT}/upstream/parameter/Element.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ParameterFrameworkConfiguration.cpp
        ${PARAMETER_ROOT}/upstream/parameter/SelectionCriterionLibrary.cpp
        ${PARAMETER_ROOT}/upstream/parameter/StringParameter.cpp
        ${PARAMETER_ROOT}/upstream/parameter/CompoundRule.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ConfigurableDomains.cpp
        ${PARAMETER_ROOT}/upstream/parameter/VirtualSyncer.cpp
        ${PARAMETER_ROOT}/upstream/parameter/MappingContext.cpp
        ${PARAMETER_ROOT}/upstream/parameter/LinearParameterAdaptation.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ComponentLibrary.cpp
        ${PARAMETER_ROOT}/upstream/parameter/BitParameterBlock.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ParameterMgrFullConnector.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ConfigurableElement.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ConfigurableElementAggregator.cpp
        ${PARAMETER_ROOT}/upstream/parameter/SubsystemObject.cpp
        ${PARAMETER_ROOT}/upstream/parameter/TypeElement.cpp
        ${PARAMETER_ROOT}/upstream/parameter/PathNavigator.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ElementLocator.cpp
        ${PARAMETER_ROOT}/upstream/parameter/SimulatedBackSynchronizer.cpp
        ${PARAMETER_ROOT}/upstream/parameter/Parameter.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ComponentInstance.cpp
        ${PARAMETER_ROOT}/upstream/parameter/InstanceDefinition.cpp
        ${PARAMETER_ROOT}/upstream/parameter/SubsystemObjectCreator.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ParameterType.cpp
        ${PARAMETER_ROOT}/upstream/parameter/DomainConfiguration.cpp
        ${PARAMETER_ROOT}/upstream/parameter/PluginLocation.cpp
        ${PARAMETER_ROOT}/upstream/parameter/HardwareBackSynchronizer.cpp
        ${PARAMETER_ROOT}/upstream/parameter/SystemClass.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ElementLibrary.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ParameterAccessContext.cpp
        ${PARAMETER_ROOT}/upstream/parameter/XmlParameterSerializingContext.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ElementHandle.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ParameterMgr.cpp
        ${PARAMETER_ROOT}/upstream/parameter/SelectionCriterionType.cpp
        ${PARAMETER_ROOT}/upstream/parameter/Subsystem.cpp
        ${PARAMETER_ROOT}/upstream/parameter/IntegerParameterType.cpp
        ${PARAMETER_ROOT}/upstream/parameter/BitParameterType.cpp
        ${PARAMETER_ROOT}/upstream/parameter/SelectionCriterion.cpp
        ${PARAMETER_ROOT}/upstream/parameter/XmlElementSerializingContext.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ElementLibrarySet.cpp
        ${PARAMETER_ROOT}/upstream/parameter/FrameworkConfigurationLocation.cpp
        ${PARAMETER_ROOT}/upstream/parameter/ParameterAdaptation.cpp
        ${PARAMETER_ROOT}/upstream/parameter/XmlFileIncluderElement.cpp
        ${PARAMETER_ROOT}/upstream/xmlserializer/XmlElement.cpp
        ${PARAMETER_ROOT}/upstream/xmlserializer/XmlSerializingContext.cpp
        ${PARAMETER_ROOT}/upstream/xmlserializer/XmlMemoryDocSource.cpp
        ${PARAMETER_ROOT}/upstream/xmlserializer/XmlDocSource.cpp
        ${PARAMETER_ROOT}/upstream/xmlserializer/XmlMemoryDocSink.cpp
        ${PARAMETER_ROOT}/upstream/xmlserializer/XmlStreamDocSink.cpp
        ${PARAMETER_ROOT}/upstream/parameter/CommandHandlerWrapper.cpp
        )


add_library(libparameter SHARED ${SOURCE_FILES})
target_include_directories(libparameter PUBLIC
        $(PARAMETER_ROOT)/upstream/parameter
        $(PARAMETER_ROOT)/upstream/parameter/log/include
        $(PARAMETER_ROOT)/upstream/parameter/include
        $(PARAMETER_ROOT)/upstream/xmlserializer
        $(PARAMETER_ROOT)/upstream/remote-processor
        $(PARAMETER_ROOT)/support/android/parameter
        )
target_compile_options(libparameter PRIVATE
        -frtti
        -fexceptions
        )
target_link_libraries(libparameter
        libremote-processor
        libpfw_utility
        libxml2
        )